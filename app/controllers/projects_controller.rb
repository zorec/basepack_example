class ProjectsController < ResourcesController

  default_query do
    { "f[end_gteq_or_null]" => Date.today, "f[start_lt_or_null]" => Date.today + 1.month }
  end
end