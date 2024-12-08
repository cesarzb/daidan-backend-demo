class DeleteExpenditure < BaseMutation
  argument :id, ID, required: true

  type ExpenditureType

  def resolve(id:)
    expenditure = Expenditure[id]
    raise GraphQL::ExecutionError, 'Expenditure not found' unless expenditure

    expenditure.destroy
    expenditure
  rescue Sequel::Error => e
    GraphQL::ExecutionError.new("Unable to delete expenditure: #{e.message}")
  end
end
