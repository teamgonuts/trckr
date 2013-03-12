require 'digest/sha1'

class AdminUser < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :item_edits
  has_many :items, :through => :item_edits


  #sexy validations
  validates :first_name, :presence => true, :length => {:maximum => 40}

  validates :last_name, :presence => true, :length => {:maximum => 40}

  validates :username, :presence => true,
                       :length => {:within => 3..25},
                       :format => ALPHA_NUMERIC_REGEX,
                       :uniqueness => true

  validates :email, :presence => true, :length => {:maximum => 100},
                    :format => EMAIL_REGEX, :confirmation => true,
                    :uniqueness => true
                

  def self.make_salt(username = "")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password = "", salt = "")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
end
