class CreateConversations < ActiveRecord::Migration
  def self.up
    create_table :conversations do |t|
      t.integer :id
      t.string :title, :limit => 50
      t.integer :board_id
      t.integer :user_id

      t.timestamps
    end
    add_index :conversations, :board_id
    add_index :conversations, :user_id
  end

  def self.down
    drop_table :conversations
  end
end