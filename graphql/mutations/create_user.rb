class CreateUser < Daidan::BaseMutation
  argument :name, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true

  type UserType

  def execute_mutation(name:, email:, password:)
    raise GraphQL::ExecutionError, 'Authentication required' unless context[:current_user]

    User.create(name: name, email: email, password: password)
  rescue Sequel::Error => e
    GraphQL::ExecutionError.new("Unable to create user: #{e.message}")
  end
end
