class Inscription < ActiveRecord::Base
	belongs_to :club
	belongs_to :user

  	def user
    	return User.find_by_id(self.id)
  	end
end
