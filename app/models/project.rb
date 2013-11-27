# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  start       :date
#  end         :date
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Project < ActiveRecord::Base
  belongs_to :user, inverse_of: :created_projects
  has_many :versions, inverse_of: :project
  has_many :issues, inverse_of: :project
  has_many :tags, through: :issues
  
  validates_presence_of :name
  validates_uniqueness_of :name

  # strip_attributes :collapse_spaces => true

  accepts_nested_attributes_for :versions

  rails_admin do
    exclude_fields :id, :created_at, :updated_at, :issues
    
    list do
      field :name do
        formatted_value do 
          bindings[:view].project_link(bindings[:object])
        end
      end
      field :user do 
        label "Author"
        pretty_value do
          bindings[:object].user || "Anonymous"
        end
      end
    end

    show do
      field :user do 
        label "Author"
        pretty_value do
          bindings[:object].user || "Anonymous"
        end
      end
    end

    edit do
      field :name
      field :description
      field :start
      field :end
      field :user do
        visible false
      end
      field :versions
      exclude_fields :tags
    end
  end
end
