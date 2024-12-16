class UserType < Daidan::BaseUserType
  field :name, String, null: false
  field :expenditures, [ExpenditureType], null: true,
                                          description: 'List of expenditures by the user'

  def expenditures
    object.expenditures
  end
end
