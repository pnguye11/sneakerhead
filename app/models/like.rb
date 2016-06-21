class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :shoe
  validates_uniqueness_of :shoe_id
end
