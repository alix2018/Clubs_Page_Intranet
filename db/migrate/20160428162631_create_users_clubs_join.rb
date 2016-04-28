class CreateUsersClubsJoin < ActiveRecord::Migration
	def self.up
		create_table 'users_clubs', :id =>false do |t|
			t.column :user_id, :integer
			t.column :club_id, :integer
			t.column :admin, :boolean
	end
	end
end
