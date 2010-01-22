class Tagging < ActiveRecord::Base
  belongs_to :post
  belongs_to :group
  belongs_to :tag
end
