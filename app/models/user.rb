class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_many :shoes
  before_save { self.email = email.downcase }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
end
