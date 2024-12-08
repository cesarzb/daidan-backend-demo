class UserType < BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :email, String, null: false
  field :expenditures, [ExpenditureType], null: true,
                                          description: 'List of expenditures by the user'

  def expenditures
    object.expenditures
  end
end
