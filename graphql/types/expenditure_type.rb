module Graphql
  module Types
    class ExpenditureType < Types::BaseObject
      field :id, ID, null: false
      field :user_id, ID, null: false
      field :name, String, null: false
      field :cost, Float, null: false
    end
  end
end
