class AdminUser < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :item_edits
  has_many :items, :through => :item_edits

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  #sexy validations
  validates :first_name, :presence => true, :length => {:maximum => 40}

  validates :last_name, :presence => true, :length => {:maximum => 40}

  validates :username, :presence => true,
                       :length => {:within => 3..25},
                       :uniqueness => true

  validates :email, :presence => true, :length => {:maximum => 100},
                    :format => EMAIL_REGEX, :confirmation => true,
                    :uniqueness => true
                

end
