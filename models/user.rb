require 'sequel'

class User < Sequel::Model
  one_to_many :expenditures
  set_dataset :users

  plugin :validation_helpers

  def validate
    super
    validates_presence [:name, :email], message: "is required"
    validates_unique :email, message: "is already taken"
    validates_format /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, :email, message: "is not a valid email address"
    validates_min_length 3, :name, message: "must be at least 3 characters long"
  end
end
