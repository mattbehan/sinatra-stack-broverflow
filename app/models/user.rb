class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments
  has_many :votes
  has_many :questions
  has_many :answers

  validates :display_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  # needs custom validation for verifying existence of password. up to you Nicole!

end
