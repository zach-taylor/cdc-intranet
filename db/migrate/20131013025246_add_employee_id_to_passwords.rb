class AddEmployeeIdToPasswords < ActiveRecord::Migration
  def self.up
  	add_column :passwords, :employee_id, :integer
  end

  def self.down
  	remove_column :passwords, :employee_id
  end
end
