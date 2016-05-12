class RemoveHour < ActiveRecord::Migration
  def change
  	remove_column :events, :hour_start
  	remove_column :events, :hour_end
  	change_column :events, :date_start, :datetime
    change_column :events, :date_end, :datetime
  end
end
