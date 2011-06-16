class Article < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  
  validates :content, :presence => true
  validates :user_id, :presence => true
  
  default_scope :order => 'articles.created_at DESC'
end
