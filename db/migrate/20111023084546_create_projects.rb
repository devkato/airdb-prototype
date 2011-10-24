class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, :null => false
      t.string :description, :null => false, :default => ""
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
