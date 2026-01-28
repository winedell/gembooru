class DeleteUserJob < ApplicationJob
  def perform(user)
    UserDeletion.new(user: user).delete_user
  end
end
