class CreateComments < ActiveRecord::Migration

  def up  
    create_table :comments do |t|
      t.references :item

      t.string "user" #user that posted the comment
      t.string "location" #location of commenting user
      t.string "picture_path" #path to new picture of tracked item

      t.timestamps
    end

    add_index("comments", "item_id")
  end

  def down
    drop_table :comments
  end

end
