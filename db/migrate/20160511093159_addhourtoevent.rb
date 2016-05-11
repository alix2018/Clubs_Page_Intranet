class Addhourtoevent < ActiveRecord::Migration
  def change
  	add_column :events, :hour_start, :time
  	add_column :events, :hour_end, :time
  end
end
