require 'bcrypt'
require 'sequel'

class User < Sequel::Model
  include BCrypt
  attr_accessor :password

  one_to_many :expenditures
  set_dataset :users

  plugin :validation_helpers

  def before_save
    super
    encrypt_password if password
  end

  def validate
    super
    validates_presence [:name, :email], message: "is required"
    validates_unique :email, message: "is already taken"
    validates_format /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, :email, message: "is not a valid email address"
    validates_min_length 3, :name, message: "must be at least 3 characters long"
    errors.add(:password, 'cannot be empty') if new? && !password
    errors.add(:password, 'must be at least 6 characters') if password && password.length < 6
  end

  def authenticate(submitted_password)
    Password.new(password_digest) == submitted_password
  end

  private

  def encrypt_password
    self.password_digest = Password.create(password)
  end
end