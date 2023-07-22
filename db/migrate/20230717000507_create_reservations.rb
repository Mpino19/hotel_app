class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.integer :people, null: false
      t.integer :user_id
      t.integer :room_id


      t.timestamps
    end
  end
end
