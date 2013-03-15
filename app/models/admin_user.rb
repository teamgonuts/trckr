require 'digest/sha1'

class AdminUser < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :item_edits
  has_many :items, :through => :item_edits

  attr_accessor :password #Item attribute not saved in the db
  attr_protected :hashed_password, :salt


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

  #only on create, so other attributes of this user can be changed
  validates_length_of :password, :within => 6...25, :on => :create
                
  before_save :create_hashed_password
  after_save :clear_password

  scope :sorted, order("admin_users.last_name ASC, admin_users.first_name ASC")
  
  def self.authenticate(username = "", password = "")
    user = AdminUser.find_by_username(username.to_s)

    if user && user.password_match?(password)
        return user #passwords match, return user object
    else
        return false
    end
  end

  #the same password string with the same hash method and salt should
  #always generate the same hashed_password
  def password_match?(password="")
    hashed_password == AdminUser.hash_with_salt(password, salt)
  end

  def self.make_salt(username = "")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password = "", salt = "")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  #returns the first and last name as a string
  def name
    "#{first_name} #{last_name}"
  end

  private

  def create_hashed_password
    #whenever :password has a value, hashing is needed
    unless password.blank?
      #always use "self" when assigning values
      self.salt = AdminUser.make_salt(username) if salt.blank?
      self.hashed_password = AdminUser.hash_with_salt(password, salt)
    end
  end

  def clear_password
    #for security and b/c hashing is not needed
    self.password = nil
  end

end





