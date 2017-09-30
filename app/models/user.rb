require 'securerandom'

class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true
  validates :email, uniqueness: true, case_sensitive: false
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :profiles

  before_save :generate_token

  def generate_token
    token = SecureRandom.hex(5)
    if User.find_by(token: token)
      generate_token
    else
      self.token = token
    end
  end
end
