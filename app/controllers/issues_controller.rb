class IssuesController < ResourcesController
  belongs_to :project, optional: true

  def get_involved
    if user_signed_in?
      resource.involved_users << current_user unless resource.involved_users.include? current_user
      if resource.save
        flash[:notice] = "You are involved in #{resource.name}!"
      else
        flash[:error] = "Something went wrong! You can't get involved."
      end
    else 
      flash[:error] = "You must be logged in to perform this action!"
    end
    render :index
  end

  def get_uninvolved
    if user_signed_in?
      resource.involved_users.delete(current_user)
      if resource.save
        flash[:notice] = "You are not involved in this issue anymore!"
      else
        flash[:error] = "Something went wrong! You can't get uninvolved."
      end
    else 
      flash[:error] = "You must be logged in to perform this action!"
    end
    render :index
  end

  # default_query do
  #   {"f[open_eq]" => true}
  # end

  # def query_polymorphic_path(*a)
  #   polymorphic_path([:query, Issue], a.last)
  # end 
end
