class Club < ActiveRecord::Base
	has_many :users,through: :users_clubs
end
