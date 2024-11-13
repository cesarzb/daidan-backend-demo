require 'graphql'
require_relative 'types/query_type'
require_relative 'mutations/mutation_type'

class Schema < GraphQL::Schema
  query(Types::QueryType)
  mutation(Types::MutationType)
end
