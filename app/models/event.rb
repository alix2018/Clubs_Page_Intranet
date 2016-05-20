class Event < ActiveRecord::Base
  validates :title, presence: {message: "Tu trouves pas qu't'as oublié quelque chose?!"}
  validates :date_start, presence: {message: "Tu trouves pas qu't'as oublié quelque chose?!"}
  validates :date_end, presence: {message: "Tu trouves pas qu't'as oublié quelque chose?!"}
  validate :start_must_be_before_end_date
  validates :title, length: { maximum: 140 }
  validate :start_must_be_before_actual_time
  validate :end_must_be_before_actual_time

  belongs_to :club
  belongs_to :user
  
  private

  def start_must_be_before_end_date
  	if date_start!=nil && date_end!=nil
      errors.add(:date_start, "Tu as saisis une date de début plus grande qu'une date de fin... SHAME...SHAME ON YOU!!!") unless
        date_start < date_end
    end
  end

  #Permet d'éviter à un membre de créer un événement antérieure à la date et heure actuelle
  def start_must_be_before_actual_time
    if date_start
      if date_start <= Time.now.strftime("%Y-%m-%d %H:%M") && date_start !=nil
        errors.add(:date_start, "Tu as saisi une date antérieure à la date actuelle") unless
          date_start >= Time.now.strftime("%Y-%m-%d %H:%M")
      end
    end
  end

  def end_must_be_before_actual_time
    if date_end
      if date_end <= Time.now.strftime("%Y-%m-%d %H:%M")
        errors.add(:date_end, "Tu as saisi une date antérieure à la date actuelle") unless
          date_end >= Time.now.strftime("%Y-%m-%d %H:%M")
      end
    end
  end
end
