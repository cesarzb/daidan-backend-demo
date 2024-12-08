module Graphql
  module Types
    class QueryType < Types::BaseObject
      description 'The query root of this schema'

      field :users, [::Graphql::Types::UserType], null: false do
        description 'Retrieve a list of users'
      end

      field :expenditures, [::Graphql::Types::ExpenditureType], null: false do
        description 'Retrieve a list of expenditures'
      end

      def expenditures
        raise GraphQL::ExecutionError, 'Authentication required' unless context[:current_user]

        ::Models::Expenditure.all
      end

      def users
        raise GraphQL::ExecutionError, 'Authentication required' unless context[:current_user]

        ::Models::User.all
      end
    end
  end
end
