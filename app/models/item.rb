class Item < ActiveRecord::Base
  attr_accessible :item_description, :origin, :name, :original_owner

  has_many :comments
  has_many :item_edits
  has_many :editors, :through => :item_edits, :class_name => "AdminUser"

end
