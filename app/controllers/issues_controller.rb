class IssuesController < ResourcesController
  belongs_to :project, optional: true

  # default_query do
  #   {"f[open_eq]" => true}
  # end

  # def query_polymorphic_path(*a)
  #   polymorphic_path([:query, Issue], a.last)
  # end 
end
