class AddRoleIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role_id, :integer, :default => 5
  end

  def self.down
    remove_column :users, :role_id
  end
end
