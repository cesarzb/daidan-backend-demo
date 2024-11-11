require 'rack'
require 'json'
require_relative 'database'
require 'graphql'
require_relative 'schema'

class App
  def call(env)
    req = Rack::Request.new(env)

    if req.post? && req.path == '/graphql'
      body = req.body.read
      params = body.empty? ? {} : JSON.parse(body)

      result = Schema.execute(
        params['query'],
        variables: params['variables'],
        context: {},
      )
      [200, { 'content-type' => 'application/json' }, [result.to_json]]
    else
      [404, { 'content-type' => 'text/plain' }, ['Not Found']]
    end
  end
end
