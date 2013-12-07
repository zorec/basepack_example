class ProjectsController < ResourcesController

  default_query do
    { # display projects which haven't ended yet (end today or later)
      "f[end_gteq_null]" => Date.today,

      # sorted by start of project 
      "f[s]" => 'start asc'
    }
  end
end