class CreateExpenditure < Daidan::BaseMutation
  argument :name, String, required: true
  argument :cost, Float, required: true

  type ExpenditureType

  def execute_mutation(name:, cost:)
    current_user = context[:current_user]
    raise GraphQL::ExecutionError, 'Authentication required' unless current_user

    Expenditure.create(user_id: current_user.id, name: name, cost: cost)
  rescue Sequel::Error => e
    GraphQL::ExecutionError.new("Unable to create expenditure: #{e.message}")
  end
end
