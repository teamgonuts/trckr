class FixHashedPasswordLength < ActiveRecord::Migration
  def up
    change_table :admin_users do |t|
      change_column :admin_users, :hashed_password, :string, :limit => nil
    end
  end

  def down
    change_table :admin_users do |t|
      change_column :admin_users, :hashed_password, :string, :limit => 30
    end
  end
end
