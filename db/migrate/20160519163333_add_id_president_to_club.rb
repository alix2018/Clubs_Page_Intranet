class AddIdPresidentToClub < ActiveRecord::Migration
  def change
  	  add_column :clubs, :president_id, :int
  end
end
