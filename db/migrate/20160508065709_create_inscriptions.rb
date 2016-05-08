class CreateInscriptions < ActiveRecord::Migration
  def change
    create_table :inscriptions do |t|
      t.integer :club_id
      t.integer :user_id
      t.boolean :valide
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
