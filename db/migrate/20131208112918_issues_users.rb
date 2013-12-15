class IssuesUsers < ActiveRecord::Migration
  def change
    create_table :issues_users, id: false do |t|
      t.integer :issue_id
      t.integer :user_id

      t.timestamps
    end
  end
end
