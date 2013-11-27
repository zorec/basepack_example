class ProjectsController < ResourcesController

  default_query do
    { "f[end_gteq_or_null]" => Date.today } 
  end
end