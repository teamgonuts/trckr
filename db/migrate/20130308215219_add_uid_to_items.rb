class AddUidToItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.string :uid
      t.rename :item_description, :description
    end
  end
end
