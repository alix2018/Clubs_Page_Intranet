class Inscription < ActiveRecord::Base
	belongs_to :mailing
    default_scope { order(id: 'asc') }
  	def user
    	return User.find_by_id(self.id)
  	end
end
