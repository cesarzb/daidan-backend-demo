require 'sequel'

class User < Sequel::Model
  one_to_many :expenditures
  set_dataset :users
end
