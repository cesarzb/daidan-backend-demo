class DeleteUser < BaseMutation
  argument :id, ID, required: true

  type UserType

  def resolve(id:)
    user = User[id]
    raise GraphQL::ExecutionError, 'User not found' unless user

    user.destroy
    user
  rescue Sequel::Error => e
    GraphQL::ExecutionError.new("Unable to delete user: #{e.message}")
  end
end
