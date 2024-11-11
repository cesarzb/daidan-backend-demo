require 'sequel'

class Expenditure < Sequel::Model
  many_to_one :user
  set_dataset :expenditures
end
