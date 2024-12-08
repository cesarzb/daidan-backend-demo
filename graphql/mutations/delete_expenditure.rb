module Graphql
  module Mutations
    class DeleteExpenditure < BaseMutation
      argument :id, ID, required: true

      type ::Graphql::Types::ExpenditureType

      def resolve(id:)
        expenditure = ::Models::Expenditure[id]
        raise GraphQL::ExecutionError, "Expenditure not found" unless expenditure

        expenditure.destroy
        expenditure
      rescue Sequel::Error => e
        GraphQL::ExecutionError.new("Unable to delete expenditure: #{e.message}")
      end
    end
  end
end
