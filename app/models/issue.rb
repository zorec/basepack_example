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
#  version_id  :integer
#

class Issue < ActiveRecord::Base
  belongs_to :project, inverse_of: :issues
  belongs_to :version, inverse_of: :issues
  belongs_to :user, inverse_of: :issues

  validates_presence_of :name

  acts_as_commentable
  acts_as_taggable
  
  rails_admin do
    exclude_fields :base_tags, :id, :created_at, :updated_at
    
    list do
      # display issue's name as a link
      # field :name do
      #   formatted_value do
      #     o = bindings[:object]
      #     bindings[:view].link_to o.name, o 
      #   end
      # end
      # field :status, :enum
      # field :resolution, :enum
      exclude_fields :tags, :tag_list, :project
    end

    edit do
      field :name
      field :description
      field :project do
        visible do
          IssuesController === bindings[:controller]
        end
      end

      field :version do
        param = "f[project_id_eq]"
        options_source_params do
          { param => bindings[:object].try(:project_id) || -1 }
        end
        html_attributes do
          { data: { "dependant-filteringselect" => "field=project_id", "dependant-param" => param } }
        end
      end

      field :status, :enum do
        html_attributes do
        {   
          data: { 
            "dynamic-fields" => [
              { condition: ["Unconfirmed", "New", "Assigned", "Reopened", "Ready"], field_actions: { resolution: { visible: false }} },
              { condition: ["Resolved", "Verified"], field_actions: { resolution: { visible: true  }} },
            ]   
          }   
        }   
        end 
      end
      field :resolution, :enum

      field :tag_list do
        partial 'tag_list_with_suggestions'
      end
      exclude_fields :tags
    end
  end

  def status_enum
    ["Unconfirmed", "New", "Assigned", "Reopened", "Ready", "Resolved", "Verified"].map { |x| [(x+'<b>Closed</b>').html_safe,x]}
  end

  def resolution_enum
    ["Fixed", "Invalid", "Wontfix", "Worksforme", "Incomplete"]
  end

end
