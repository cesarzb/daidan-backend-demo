require_relative '../base_object'
require_relative 'base_mutation'
require_relative 'create_user'
require_relative 'update_user'
require_relative 'delete_user'
require_relative 'create_expenditure'
require_relative 'update_expenditure'
require_relative 'delete_expenditure'
require_relative 'login_user'

module Types
  class MutationType < Types::BaseObject
    description "The mutation root of this schema"

    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :delete_user, mutation: Mutations::DeleteUser

    field :create_expenditure, mutation: Mutations::CreateExpenditure
    field :update_expenditure, mutation: Mutations::UpdateExpenditure
    field :delete_expenditure, mutation: Mutations::DeleteExpenditure

    field :login_user, mutation: Mutations::LoginUser
  end
end
