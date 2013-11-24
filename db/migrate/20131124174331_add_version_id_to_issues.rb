class AddVersionIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :version_id, :integer
  end
end
