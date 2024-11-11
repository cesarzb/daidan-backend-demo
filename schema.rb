require 'graphql'
require_relative 'graphql/types/query_type'

class Schema < GraphQL::Schema
  query(Types::QueryType)
end
