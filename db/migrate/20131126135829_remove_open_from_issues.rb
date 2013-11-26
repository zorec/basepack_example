class RemoveOpenFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :open
  end
end
