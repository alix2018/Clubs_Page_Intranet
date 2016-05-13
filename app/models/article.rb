class Article < ActiveRecord::Base
	validates :title, presence: {message: "Tu trouves pas qu't'as oublié quelque chose?!"}
	validates :content, presence: {message: "Tu trouves pas qu't'as oublié quelque chose?!"}
	validates :title, length: { maximum: 150, message: "C'est trop long, comme ma... (Maximum 40 caractères)" }
  	#validates :description, length: {minimum: 200, message: "Pas assez de caractères, un petit effort ;) (Minimum 200 caractères)"}

	belongs_to :club
	belongs_to :user
end
