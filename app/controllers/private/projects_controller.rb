module Private
  class ProjectsController < ::ResourcesController
    layout "application-fluid"
    before_filter :authenticate_user!
  end
end