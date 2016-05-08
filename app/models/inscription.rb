class Inscription < ActiveRecord::Base
	belongs_to :mailing
  	def user
    	return User.find_by_id(self.id)
  	end
end
