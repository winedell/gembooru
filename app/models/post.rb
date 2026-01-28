class Post < ApplicationRecord
  class RevertError < StandardError; end
  class DeletionError < StandardError; end

  normalizes :source, with: ->(source) { Post.normalize_source(source) }, apply_to_nil: true
  before_validation :normalize_tags

  if PostVersion.enabled?
    has_many :versions, -> { Rails.env.test? ? order("post_versions.updated_at ASC, post_versions.id ASC") : order("post_versions.updated_at ASC") }, class_name: "PostVersion", dependent: :destroy
  end
end