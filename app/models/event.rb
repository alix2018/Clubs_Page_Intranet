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

  scope :between, lambda {|date_start, date_end|  
   {:conditions => ["? < starts_at < ?", Event.format_date(date_start),      Event.format_date(date_end)] }  
  }  
  def self.format_date(date_time)  
   Time.at(date_time.to_i).to_formatted_s(:db)  
  end 

  def as_json(options = {})  
   {  
    :id => self.id,  
    :title => self.title,  
    :description => self.(location.concat(" ").concat(description)) || "",  
    :start => date_start.rfc822,  
    :end => date_end.rfc822,  
    :allDay => self.all_day,  
    :recurring => false,  
    :url => Rails.application.routes.url_helpers.event_path(id),
   }  
  end  
end
