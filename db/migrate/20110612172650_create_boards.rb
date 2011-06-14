class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
      t.integer :id
      t.string :title, :limit => 50

      t.timestamps
    end
    
  end

  def self.down
    drop_table :boards
  end
end
