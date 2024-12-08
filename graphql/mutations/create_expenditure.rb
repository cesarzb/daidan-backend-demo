module Graphql
  module Mutations
    class CreateExpenditure < BaseMutation
      argument :user_id, ID, required: true
      argument :name, String, required: true
      argument :cost, Float, required: true

      type ::Graphql::Types::ExpenditureType

      def resolve(user_id:, name:, cost:)
        user = ::Models::User[user_id]
        raise GraphQL::ExecutionError, 'User not found' unless user

        Expenditure.create(user_id: user_id, name: name, cost: cost)
      rescue Sequel::Error => e
        GraphQL::ExecutionError.new("Unable to create expenditure: #{e.message}")
      end
    end
  end
end
