class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :user
  validates_presence_of :name, :start_at, :end_at, :spot
  
  has_attached_file :flyer, :styles => { :small => '300x300#' },
                    :url  => "/assets/events/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"
end
