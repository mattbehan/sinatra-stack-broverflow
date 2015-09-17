class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: true
  validates :body, presence: true

  def find_display_name(user_id)
    User.find_by(id: user_id).display_name
  end

  def find_answers_for_question(question_id)
    Answer.where(question_id: question_id).count
  end

  def find_taggings_for_question(question_id)
    Tagging.where(question_id: question_id)
  end

  def find_author_reputation(user_id)
    User.find_by(id: user_id).votes.count
  end

  def sum_votes_for_question
    votes.sum(:value)
  end
end
