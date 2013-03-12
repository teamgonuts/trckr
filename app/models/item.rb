class Item < ActiveRecord::Base
  attr_accessible :description, :origin, :name, :original_owner, :uid, :message

  has_many :comments
  has_many :item_edits
  has_many :editors, :through => :item_edits, :class_name => "AdminUser"

  validates_presence_of :name, :description, :origin, :original_owner
  validates_uniqueness_of :uid


end
