class Inscription < ActiveRecord::Base
	belongs_to :club
  	def user
    	return User.find_by_id(self.id)
  	end
end
