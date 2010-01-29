class Event < ActiveRecord::Base
  
  has_event_calendar
  
  belongs_to :user
  
  after_validation :date_controll
  
  validates_presence_of :name, :start_at, :end_at, :spot
  
  has_attached_file :flyer, :styles => { :small => '300x300#' },
                    :url  => "/assets/events/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"
        
  private
  
  def date_controll
    if self.start_at != nil && self.end_at !=nil
      check_dates
    end
  end
  
  def check_dates
    if self.start_at > self.end_at
      self.end_at = self.start_at
    end
  end
end
