class QueryType < BaseObjectType
  description 'The query root of this schema'

  field :users, [UserType], null: false do
    description 'Retrieve a list of users'
  end

  field :expenditures, [ExpenditureType], null: false do
    description 'Retrieve a list of expenditures'
  end

  def expenditures
    raise GraphQL::ExecutionError, 'Authentication required' unless context[:current_user]

    Expenditure.all
  end

  def users
    raise GraphQL::ExecutionError, 'Authentication required' unless context[:current_user]

    User.all
  end
end
