class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :comment
      t.integer :rider_id
      t.boolean :approved, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
