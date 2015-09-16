class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :taggings

  validates :name, presence: true
end
