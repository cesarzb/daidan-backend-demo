class ExpenditureType < Daidan::BaseObjectType
  field :user, UserType, null: false,
                         description: 'Owner of an expenditure.'
  field :name, String, null: false
  field :cost, Float, null: false
end
