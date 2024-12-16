class User < Daidan::User
  one_to_many :expenditures

  def validate
    super
    validates_presence :name, message: 'is required'
    validates_min_length 3, :name, message: 'must be at least 3 characters long'
  end
end
