class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :value, presence: true
end
