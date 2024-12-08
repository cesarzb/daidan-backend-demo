module Graphql
  module Mutations
    class UpdateUser < BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :email, String, required: false

      type ::Graphql::Types::UserType

      def resolve(id:, name: nil, email: nil)
        user = ::Models::User[id]
        raise GraphQL::ExecutionError, 'User not found' unless user

        user.update(name: name) if name
        user.update(email: email) if email

        user
      rescue Sequel::Error => e
        GraphQL::ExecutionError.new("Unable to update user: #{e.message}")
      end
    end
  end
end
