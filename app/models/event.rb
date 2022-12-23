class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    
    has_many :attendances, foreign_key: "attended_event_id"
    has_many :attendees, through: :attendances

    scope :past_event, -> { where("event_date <= ?", Date.today) }
    scope :upcoming_event, -> { where("event_date > ?", Date.today) }
end
