class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :articles, :user_id
  end

  def self.down
    drop_table :articles
  end
end
