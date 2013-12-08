class ActsAsTaggableOnTagsController < ResourcesController
  # to use correct model name see https://github.com/josevalim/inherited_resources#overwriting-defaults
  defaults resource_class: ActsAsTaggableOn::Tag
end