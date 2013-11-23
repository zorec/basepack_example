class ProjectsController < ResourcesController
  include Lepidlo::Import::Controller

  # default_query do
  #   { "f[end_gteq]" => Date.today } 
  # end
end