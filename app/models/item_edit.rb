class ItemEdit < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :item
  belongs_to :editor , :class_name => "AdminUser", :foreign_key => 'admin_user_id'
end
