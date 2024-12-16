class CreateUser < Daidan::BaseMutation
  argument :name, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true

  type UserType

  def resolve(name:, email:, password:)
    User.create(name: name, email: email, password: password)
  rescue Sequel::Error => e
    GraphQL::ExecutionError.new("Unable to create user: #{e.message}")
  end
end
