class RealTable < ActiveRecord::Base

  def self.set_table(table)
    establish_connection(
      :adapter   => 'mysql2',
      :encoding  => 'utf8',
      :reconnect => false,
      :database  => table.project.real_name,
      :username  => 'root',
      :password  => ''
    )
    set_table_name table.real_name
  end

  def self.column_namez
    return self.column_names.reject{|col| col == 'id'}
  end

  def self.add_column(table, column_name = nil)
    table_name = table.real_name
    column_name = %!column#{self.column_namez.size + 1}! if column_name.nil?

    RealTable.connection.execute(%!ALTER TABLE `#{table_name}` ADD COLUMN `#{column_name}` VARCHAR(255) NOT NULL DEFAULT ''!)
    RealTable.reset_column_information
  end

  def self.drop_column(table, column_name)
    table_name = table.real_name

    RealTable.connection.execute(%!ALTER TABLE `#{table_name}` DROP COLUMN `#{column_name}`!)
    RealTable.reset_column_information
  end
end
