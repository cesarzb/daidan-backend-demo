require_relative 'base_object'
require_relative 'user_type'
require_relative '../../models/user'

module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    field :users, [Types::UserType], null: false do
      description "Retrieve a list of users"
    end

    def users
      User.all
    end
  end
end
