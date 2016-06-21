class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_many :shoes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_shoes, through: :likes, source: :shoe
  before_save { self.email = email.downcase }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
end
