require_relative '../types/user_type'

module Mutations
  class DeleteUser < Types::BaseMutation
    argument :id, ID, required: true

    type Types::UserType

    def resolve(id:)
      user = User[id]
      raise GraphQL::ExecutionError, "User not found" unless user

      user.destroy
      user
    rescue Sequel::Error => e
      GraphQL::ExecutionError.new("Unable to delete user: #{e.message}")
    end
  end
end
