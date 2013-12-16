class ProjectsController < ResourcesController

  def show_form
    show_form! do |form|
      form.hide_fields(:privacy)
    end
  end

  def list_form
    list_form! do |form|
      form.hide_fields(:privacy)
    end 
  end

  def edit_form
    edit_form! do |form|
      form.hide_fields(:privacy)
    end 
  end 

  default_query do
    { # display projects which haven't ended yet (end today or later)
      "f[end_gteq_null]" => Date.today,

      # sorted by start of project 
      "f[s]" => 'start asc'
    }
  end
end