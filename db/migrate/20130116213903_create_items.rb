class CreateItems < ActiveRecord::Migration

  def up
    create_table :items do |t|
      t.string "name"
      t.string "item_description"
      t.string "origin"
      t.string "original_owner"
      t.string "current_owner"
      t.string "picture_path"


      t.timestamps
    end

  end
  
  def down
    drop_table :items
  end
end
