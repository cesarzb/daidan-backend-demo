module Graphql
  module Types
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :email, String, null: false
      field :expenditures, [::Graphql::Types::ExpenditureType], null: true, description: "List of expenditures by the user"

      def expenditures
        object.expenditures
      end
    end
  end
end