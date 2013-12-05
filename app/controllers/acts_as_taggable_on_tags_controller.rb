class ActsAsTaggableOnTagsController < ResourcesController
  defaults resource_class: ActsAsTaggableOn::Tag
end