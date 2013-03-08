class CreateItemEdits < ActiveRecord::Migration
  def self.up
    create_table :item_edits do |t|
      t.references :admin_user
      t.references :item
      t.string "summary"

      t.timestamps
    end
    add_index :item_edits, ['admin_user_id', 'item_id']
  end

  def self.down
    drop_table :item_edits 

  end
end
