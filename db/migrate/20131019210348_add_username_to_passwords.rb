class AddUsernameToPasswords < ActiveRecord::Migration
  def self.up
  	add_column :passwords, :username, :string
  end

  def self.down
  	remove_column :passwords, :username
  end
end
