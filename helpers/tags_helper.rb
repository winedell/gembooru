module TagsHelper
  def tags_class(tag)
    return nil if tag.blank?
    "tag-type-#{tag.category}"
  end
end
