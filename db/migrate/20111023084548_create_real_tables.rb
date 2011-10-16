class CreateRealTables < ActiveRecord::Migration
  def change
    create_table :real_tables do |t|

      t.timestamps
    end
  end
end
