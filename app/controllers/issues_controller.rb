class IssuesController < ResourcesController
  include Lepidlo::Import::Controller
  belongs_to :project, optional: true
end
