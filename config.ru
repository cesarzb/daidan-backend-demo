require 'rack'
require 'rack/cors'
require_relative 'config/application'
$LOAD_PATH.unshift(File.expand_path('../daidan/lib', __dir__))
require 'daidan'

use Rack::Reloader, 0

use Rack::Cors do
  allow do
    origins '*'

    resource '/graphql',
             headers: :any,
             methods: %i[get post options],
             credentials: false
  end
end

use Daidan::Middleware::JwtAuthentication

run Application.new
