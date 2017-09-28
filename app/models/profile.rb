class Profile < ApplicationRecord
  belongs_to :user
  validates :link, presence: true, uniqueness: true
  validates :provider, presence: true
end
