class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  belongs_to :user

end
