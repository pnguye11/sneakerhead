class User < ActiveRecord::Base
  has_many :shoes
  has_secure_password
  validates :email, :user_name, presence: true, uniqueness: true
end
