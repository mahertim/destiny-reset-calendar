class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :color
      t.boolean :allDay
      t.integer :order

      t.timestamps null: false
    end
  end
end
