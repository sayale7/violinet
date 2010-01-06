class MessageCopy < ActiveRecord::Base
  
  belongs_to :message
  belongs_to :recipient
  belongs_to :folder
  
  
end
