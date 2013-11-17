class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :start
      t.date :end
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
