class AddFieldsToEmployees < ActiveRecord::Migration
  def self.up
  	add_column :employees, :email, :string
  	add_column :employees, :bio, :text
  	add_column :employees, :im, :string
  end

  def self.down
  	remove_column :employees, :email
  	remove_column :employees, :bio
  	remove_column :employees, :im
  end
end
