class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :votes, as: :votable

  validates :text, presence: true

  def sum_votes_for_comment
    votes.sum(:value)
  end

  def users_display_name
    user.display_name
  end

  def users_reputation
    user.reputation
  end

end
