class Group < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  has_many :members, :class_name => "User"
end
