require 'sequel'

module Models
  class Expenditure < Sequel::Model
    many_to_one :user
    set_dataset :expenditures

    plugin :validation_helpers

    def validate
      super
      validates_presence %i[user_id name cost], message: 'is required'
      validates_numeric :cost, message: 'must be a number'
      validates_operator :>, 0, :cost, message: 'must be greater than zero'
      validates_min_length 3, :name, message: 'must be at least 3 characters long'

      errors.add(:user_id, 'must be a valid user') unless User[user_id]
    end
  end
end
