require_relative '../base_object'
require_relative 'base_mutation'
require_relative 'create_user'
require_relative 'create_expenditure'

module Types
  class MutationType < Types::BaseObject
    description "The mutation root of this schema"

    field :create_user, mutation: Mutations::CreateUser
    field :create_expenditure, mutation: Mutations::CreateExpenditure
  end
end
