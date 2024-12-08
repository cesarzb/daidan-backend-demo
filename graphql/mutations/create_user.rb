class CreateUser < BaseMutation
  argument :name, String, required: true
  argument :email, String, required: true

  type UserType

  def resolve(name:, email:)
    User.create(name: name, email: email)
  rescue Sequel::Error => e
    GraphQL::ExecutionError.new("Unable to create user: #{e.message}")
  end
end
