require 'graphql'

module Graphql
  class Schema < GraphQL::Schema
    query(::Graphql::Types::QueryType)
    mutation(::Graphql::Types::MutationType)
  end
end
