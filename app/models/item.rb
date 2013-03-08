class Item < ActiveRecord::Base
  attr_accessible :description, :origin, :name, :original_owner, :uid

  before_create :generate_uid

  has_many :comments
  has_many :item_edits
  has_many :editors, :through => :item_edits, :class_name => "AdminUser"

  protected

  def generate_uid
      uid_length = 1
    begin
      uid = SecureRandom.hex(uid_length)
      uid_length += 1
    end while Item.where(:uid => uid).exists?
    self.uid = uid
  end

end
