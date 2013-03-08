class AdminUser < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :item_edits
  has_many :items, :through => :item_edits
end
