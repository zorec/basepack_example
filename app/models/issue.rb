# == Schema Information
#
# Table name: issues
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  open        :boolean
#  project_id  :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Issue < ActiveRecord::Base
  belongs_to :project, inverse_of: :issues
  belongs_to :user, inverse_of: :issues

  validates_presence_of :name

  acts_as_commentable

  after_initialize do 
    if new_record?
      self.open = true
    end
  end

  acts_as_taggable
  
  rails_admin do
    show do
      exclude_fields :base_tags
    end

    list do
      # display issue name as a link
      field :name do
        formatted_value do
          o = bindings[:object]
          bindings[:view].link_to o.name, o 
        end
      end
      field :open      
      exclude_fields :base_tags, :tags, :tag_list, :project
    end

    edit do
      field :name
      field :description
      field :open do 
        true
      end
      field :project
      exclude_fields :base_tags, :tags
      field :tag_list do
        partial 'tag_list_with_suggestions'
      end
    end
  end
end
