class TagRelationship < ActiveRecord::Base
  belongs_to :tag
  belongs_to :parent, :class_name => "Tag"
  belongs_to :child, :class_name  => "Tag"
  attr_accessible :parent_id, :child_id
end
