class Shoe < ActiveRecord::Base
  validates :image, presence: true

  has_attached_file :image, style:{ :medium => "640x"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_and_belongs_to_many :tags
end
