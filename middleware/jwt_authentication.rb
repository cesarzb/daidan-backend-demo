require 'jwt'
require 'yaml'

class JwtAuthentication
  def initialize(app)
    @app = app
  end

  def call(env)
    auth_header = env['HTTP_AUTHORIZATION']
    if auth_header && auth_header.start_with?('Bearer ')
      token = auth_header.split(' ').last

      secrets_path = File.expand_path('../config/secrets.yml', __dir__)
      jwt_secret = YAML.load_file(secrets_path)["jwt_secret"]

      begin
        payload, _ = JWT.decode(token, jwt_secret, true, { algorithm: 'HS256' })

        env['current_user_id'] = payload['user_id']
      rescue JWT::DecodeError
        env['current_user_id'] = nil
      end
    else
      env['current_user_id'] = nil
    end

    @app.call(env)
  end
end
