require 'jwt'
require 'yaml'
require_relative '../types/user_type'

module Mutations
  class LoginUser < Types::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: false
    field :user, Types::UserType, null: false

    def resolve(email:, password:)
      user = User.where(email: email).first

      if user && user.authenticate(password)
        payload = { user_id: user.id }


        secrets_path = File.expand_path('../../config/secrets.yml', __dir__)
        jwt_secret = YAML.load_file(secrets_path)["jwt_secret"]

        token = JWT.encode(payload, jwt_secret, 'HS256')
        { token: token, user: user }
      else
        raise GraphQL::ExecutionError, "Invalid email or password"
      end
    end
  end
end
