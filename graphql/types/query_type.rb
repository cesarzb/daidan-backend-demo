module Graphql
  module Types
    class QueryType < Types::BaseObject
      description "The query root of this schema"

      field :users, [::Graphql::Types::UserType], null: false do
        description "Retrieve a list of users"
      end

      field :expenditures, [::Graphql::Types::ExpenditureType], null: false do
        description "Retrieve a list of expenditures"
      end

      def expenditures
        if context[:current_user]
          ::Models::Expenditure.all
        else
          raise GraphQL::ExecutionError, "Authentication required"
        end
      end

      def users
        if context[:current_user]
          ::Models::User.all
        else
          raise GraphQL::ExecutionError, "Authentication required"
        end
      end
    end
  end
end