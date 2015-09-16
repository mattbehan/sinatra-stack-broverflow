class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  belongs_to :user

  def find_display_name(user_id)
    User.find_by(id: user_id).display_name
  end
end
