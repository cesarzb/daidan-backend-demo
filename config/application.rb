require 'dotenv/load'
$LOAD_PATH.unshift(File.expand_path('../../daidan/lib', __dir__))
require 'daidan'

class Application < Daidan::Application
  def graphql_schema
    Schema
  end

  def auth_middleware
    Daidan::Middleware::JwtAuthentication
  end

  def handle_json_parse_error
    [422, { 'content-type' => 'application/json' }, [{ error: 'Malformed JSON' }.to_json]]
  end

  def handle_internal_server_error(error)
    puts "Custom Log: #{error.message}"
    [500, { 'content-type' => 'application/json' }, [{ error: 'Oops, something went wrong!' }.to_json]]
  end

  def not_found_response
    [404, { 'content-type' => 'text/plain' }, ['This page does not exist.']]
  end
end
