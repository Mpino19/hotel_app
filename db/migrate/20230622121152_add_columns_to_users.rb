class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :icon_image_name, :string
    add_column :users, :self_introduce, :text
  end
end
