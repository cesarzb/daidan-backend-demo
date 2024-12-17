class MutationType < Daidan::BaseObjectType
  description 'The mutation root of this schema'

  field :create_user, mutation: CreateUser

  field :create_expenditure, mutation: CreateExpenditure
  field :update_expenditure, mutation: UpdateExpenditure
  field :delete_expenditure, mutation: DeleteExpenditure

  field :login_user, mutation: Daidan::LoginUser
end
