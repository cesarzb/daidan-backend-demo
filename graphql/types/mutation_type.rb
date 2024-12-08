module Graphql
  module Types
    class MutationType < ::Graphql::Types::BaseObject
      description 'The mutation root of this schema'

      field :create_user, mutation: ::Graphql::Mutations::CreateUser
      field :update_user, mutation: ::Graphql::Mutations::UpdateUser
      field :delete_user, mutation: ::Graphql::Mutations::DeleteUser

      field :create_expenditure, mutation: ::Graphql::Mutations::CreateExpenditure
      field :update_expenditure, mutation: ::Graphql::Mutations::UpdateExpenditure
      field :delete_expenditure, mutation: ::Graphql::Mutations::DeleteExpenditure

      field :login_user, mutation: ::Graphql::Mutations::LoginUser
    end
  end
end
