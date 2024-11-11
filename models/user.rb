require 'sequel'

class User < Sequel::Model
  set_dataset :users
end
