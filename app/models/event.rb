class Event < ActiveRecord::Base
  validates :title, presence: {message: "Tu trouves pas qu't'as oublié quelque chose?!"}
  validates :date_start, presence: {message: "Tu trouves pas qu't'as oublié quelque chose?!"}
  validates :date_end, presence: {message: "Tu trouves pas qu't'as oublié quelque chose?!"}
  validate :start_must_be_before_end_date
  validates :title, length: { maximum: 140 }

  belongs_to :club
  belongs_to :user
  
  private

  def start_must_be_before_end_date
  	if date_start!=nil && date_end!=nil
      errors.add(:date_start, "Tu as saisis une date de début plus grande qu'une date de fin... SHAME...SHAME ON YOU!!!") unless
        date_start < date_end
    end
  end
end
