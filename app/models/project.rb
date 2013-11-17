class Project < ActiveRecord::Base
  belongs_to :user, inverse_of: :created_projects
  validates_presence_of :name

  rails_admin do
    list do
      field :name
      field :description
      field :start
      field :end
      field :user
    end
    
    show do
      field :name
      field :description
      field :start
      field :end
      field :user
    end

    edit do
      field :name
      field :description
      field :start
      field :end
      field :user do
        visible false
      end
    end
  end
end
