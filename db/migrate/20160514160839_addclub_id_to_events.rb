class AddclubIdToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :club_id, :int
  end
end
