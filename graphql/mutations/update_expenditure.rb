class UpdateExpenditure < Daidan::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :cost, Float, required: false

  type ExpenditureType

  def resolve(id:, name: nil, cost: nil)
    expenditure = Expenditure[id]
    raise GraphQL::ExecutionError, 'Expenditure not found' unless expenditure

    expenditure.update(name: name) if name
    expenditure.update(cost: cost) if cost

    expenditure
  rescue Sequel::Error => e
    GraphQL::ExecutionError.new("Unable to update expenditure: #{e.message}")
  end
end
