class Item < ActiveRecord::Base
  attr_accessible :description, :origin, :name, :original_owner, :uid, :message

  has_many :comments
  has_many :item_edits
  has_many :editors, :through => :item_edits, :class_name => "AdminUser"

  validates_presence_of :name, :description, :origin, :original_owner, :uid
  validates_length_of :name, :origin, :original_owner, :maximum => 50
  validates_length_of :description, :message, :maximum=> 255
  validates_length_of :uid, :maximum => 40

  validates_format_of :uid, :with => ALPHA_NUMERIC_REGEX

  validates_uniqueness_of :uid



end
