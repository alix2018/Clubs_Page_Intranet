class AddPresident < ActiveRecord::Migration
  def change
  	  	add_column :clubs, :president, :string
  end
end
