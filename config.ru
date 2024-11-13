require_relative 'config/application'

use Rack::Reloader, 0

run Application.new