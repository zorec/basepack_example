class ActsAsTaggableOnTagsController < ResourcesController
  # include Lepidlo::Import::Controller
  defaults resource_class: ActsAsTaggableOn::Tag
end