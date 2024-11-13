require_relative '../base_object'
require_relative 'user_type'
require_relative 'expenditure_type'
require_relative '../../models/user'
require_relative '../../models/expenditure'

module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    field :users, [Types::UserType], null: false do
      description "Retrieve a list of users"
    end

    field :expenditures, [Types::ExpenditureType], null: false do
      description "Retrieve a list of expenditures"
    end

    def expenditures
      Expenditure.all
    end

    def users
      User.all
    end
  end
end
