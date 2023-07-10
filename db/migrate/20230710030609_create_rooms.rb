class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :room_image
      t.integer :price, null: false
      t.string :introduction, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
