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
  belongs_to :user, inverse_of: :created_issues
  has_and_belongs_to_many :involved_users, join_table: :issues_users, class_name: "User"

  validates_presence_of :name

  acts_as_commentable
  acts_as_taggable
  
  rails_admin do
    exclude_fields :tag_list, :tags, :base_tags, :id, :created_at, :updated_at, :comments, :user
    # show do
    #   include_fields :tag_list
    # end

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
      exclude_fields :project
    end

    edit do
      field :name
      field :description
      field :project do
        visible do
          IssuesController === bindings[:controller]
        end
      end

      # field :version do
      #   param = "f[project_id_eq]"
      #   options_source_params do
      #     { param => bindings[:object].try(:project_id) || -1 }
      #   end
      #   html_attributes do
      #     { data: { "dependant-filteringselect" => "field=project_id", "dependant-param" => param } }
      #   end
      # end
      
      field :version do
        options_source_params do
          # default query sended from form when asking for select2 items (e.g. ajax call /versions/options?<params_goes_here>)
          { "f[project_id_eq]" => bindings[:object].try(:project_id) || -1 }
        end


        html_attributes do
          #setting dependant select. Thats means when changing field "project_id", 
          # then options for dependant select2 (e.g. this field) is refreshed (new ajax call asking for options 
          # cand what is in 'dependat-param' is merged to the query params)
          { data: { "dependant-filteringselect" => "field=project_id", "dependant-param" => "f[project_id_eq]" } }
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
    end
  end

  def status_enum
    ["Unconfirmed", "New", "Assigned", "Reopened", "Ready", "Resolved", "Verified"]
  end

  def resolution_enum
    ["Fixed", "Invalid", "Wontfix", "Worksforme", "Incomplete"]
  end

end
