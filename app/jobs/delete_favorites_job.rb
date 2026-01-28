class DeleteFavoritesJob < ApplicationJob
  def perform(user)
    Post.without_timeout do
      user.favorites.destroy_all
    end
  end
end
