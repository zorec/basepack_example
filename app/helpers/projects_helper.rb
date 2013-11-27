module ProjectsHelper
  def project_link(project)
    link_to project.name, project
  end
end
