class AddMessagetoItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.string :message
    end
  end
end
