class AddStatusToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :status, :string
  end
end
