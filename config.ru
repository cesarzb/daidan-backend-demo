require 'rack'
require 'rack/cors'
require 'daidan'
require_relative 'config/application'

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
