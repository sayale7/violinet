class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :user
  validates_presence_of :name, :start_at, :end_at, :spot
end
