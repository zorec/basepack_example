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
  has_many :issues, inverse_of: :project
  
  validates_presence_of :name
  validates_uniqueness_of :name

  accepts_nested_attributes_for :issues

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
      field :issues
    end

    edit do
      field :name
      field :description
      field :start
      field :end
      field :user do
        visible false
      end
      field :issues
    end
  end
end
