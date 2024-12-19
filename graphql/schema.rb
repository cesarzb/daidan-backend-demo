class Schema < GraphQL::Schema
  query(QueryType)
  mutation(MutationType)
end
