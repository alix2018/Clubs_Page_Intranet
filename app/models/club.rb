class Club < ActiveRecord::Base
	has_many :inscriptions
  has_many :publications
  has_many :invitations
  belongs_to :user
  has_many :club_members, :dependent => :destroy
  has_many :events
  has_many :users, through: :inscriptions
  has_many :admins, -> { where("inscriptions.admin" => true) }, through: :inscriptions, source: :user
  def auto
  end
  validates :name, uniqueness: {message: "Ce nom de club est déjà pris :'("}
  validates :name, presence: {message: "Tu trouves pas qu't'as oublié quelque chose?!"}
  validates :description, presence: {message: "Tu trouves pas qu't'as oublié quelque chose?!"}
  validates :name, length: { maximum: 20, message: "C'est trop long, comme ma... (Maximum 20 caractères)" }
  #validates :description, length: {minimum: 200, message: "Pas assez de caractères, un petit effort ;) (Minimum 200 caractères)"}

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
