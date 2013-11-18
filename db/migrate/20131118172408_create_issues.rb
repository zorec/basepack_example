class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.string :description
      t.boolean :open
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
