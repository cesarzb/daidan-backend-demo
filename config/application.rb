require 'rack'
require 'json'
require 'zeitwerk'
require_relative '../db/database'
require 'graphql'

loader = Zeitwerk::Loader.new
loader.push_dir(File.expand_path('..', __dir__))
loader.setup

class Application
  def call(env)
    req = Rack::Request.new(env)

    if req.post? && req.path == '/graphql'
      body = req.body.read
      params = body.empty? ? {} : JSON.parse(body)

      current_user = env['current_user_id'] ? ::Models::User.find(id: env['current_user_id']) : nil

      result = ::Graphql::Schema.execute(
        params['query'],
        variables: params['variables'],
        context: { current_user: current_user },
        operation_name: params['operationName']
      )

      [200, { 'content-type' => 'application/json' }, [result.to_json]]
    else
      [404, { 'content-type' => 'text/plain' }, ['Not Found']]
    end
  rescue JSON::ParserError
    [400, { 'content-type' => 'application/json' }, [{ error: 'Invalid JSON' }.to_json]]
  rescue StandardError => e
    puts "Error processing request: #{e.message}"
    [500, { 'content-type' => 'application/json' }, [{ error: 'Internal Server Error' }.to_json]]
  end
end
