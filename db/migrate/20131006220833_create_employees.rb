class CreateEmployees < ActiveRecord::Migration
  def self.up
  	drop_table :riders
  	drop_table :comments
    create_table :employees do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :role
      t.boolean :active
      t.string :ssn
      t.string :bank_account
      t.string :department

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
