class Badge < ActiveRecord::Base
  # Remember to create a migration!
  has_many :users_badges

  validates :badge_name, presence: true
  validates :badge_image, presence: true
  validates :badge_level, presence: true
end
