require 'jwt'
require 'yaml'

class LoginUser < BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true

  field :token, String, null: false
  field :user, UserType, null: false

  def resolve(email:, password:)
    user = User.where(email: email).first

    raise GraphQL::ExecutionError, 'Invalid email or password' unless user && user.authenticate(password)

    payload = { user_id: user.id }

    secrets_path = File.expand_path('../../config/secrets.yml', __dir__)
    jwt_secret = YAML.load_file(secrets_path)['jwt_secret']

    token = JWT.encode(payload, jwt_secret, 'HS256')
    { token: token, user: user }
  end
end
