require_relative 'config/application'
require_relative 'middleware/jwt_authentication'

use Rack::Reloader, 0
use JwtAuthentication

run Application.new
