class ProfileEntry < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body, :author
end
