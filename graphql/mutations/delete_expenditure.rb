class DeleteExpenditure < Daidan::BaseMutation
  argument :id, ID, required: true

  type ExpenditureType

  def execute_mutation(id:)
    raise GraphQL::ExecutionError, 'Authentication required' unless context[:current_user]

    expenditure = Expenditure[id]
    raise GraphQL::ExecutionError, 'Expenditure not found' unless expenditure

    expenditure.destroy
    expenditure
  rescue Sequel::Error => e
    GraphQL::ExecutionError.new("Unable to delete expenditure: #{e.message}")
  end
end
