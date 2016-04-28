class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :location
      t.date :date_start
      t.date :date_end
      t.boolean :is_private

      t.timestamps null: false
    end
  end
end
