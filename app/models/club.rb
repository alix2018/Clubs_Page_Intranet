class Club < ActiveRecord::Base
	has_many :inscriptions
  has_many :publications
  has_many :invitations

  validates :name, presence: {message: "Tu trouves pas qu't'as oublié quelque chose?!"}
  validates :description, presence: {message: "Tu trouves pas qu't'as oublié quelque chose?!"}

  def contains_user_invalide(id)
    return self.inscriptions.where(:id => id).where(:valide => false).count > 0
  end

  def contains_user_valide(id)
    return self.inscriptions.where(:id => id).where(:valide => true).count > 0
  end

  has_attached_file :logo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
    default_url: "/unknown_user.png"

  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
