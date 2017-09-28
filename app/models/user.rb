class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true
  validates :email, uniqueness: true, case_sensitive: false
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :profiles
end
