require_relative '../types/user_type'

module Mutations
  class CreateUser < Types::BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true

    type Types::UserType

    def resolve(name:, email:)
      User.create(name: name, email: email)
    rescue Sequel::Error => e
      GraphQL::ExecutionError.new("Unable to create user: #{e.message}")
    end
  end
end
