class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name, :null => false
      t.string :description, :null => false, :default => ''
      t.integer :project_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
