require_relative '../types/expenditure_type'

module Mutations
  class DeleteExpenditure < Types::BaseMutation
    argument :id, ID, required: true

    type Types::ExpenditureType

    def resolve(id:)
      expenditure = Expenditure[id]
      raise GraphQL::ExecutionError, "Expenditure not found" unless expenditure

      expenditure.destroy
      expenditure
    rescue Sequel::Error => e
      GraphQL::ExecutionError.new("Unable to delete expenditure: #{e.message}")
    end
  end
end
