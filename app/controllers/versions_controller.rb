class VersionsController < ResourcesController
  include Lepidlo::Import::Controller

  def options
    if params[:f].try(:[], :id_eq).to_i == -1 
      authorize!(action_name.to_sym, resource_class) # CanCan
      # or use any other model method
      versions = Version.where(project_id: params[:f][:project_id_eq])
      options!(collection: [versions].compact)
    else
      options!
    end
  end
end