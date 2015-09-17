class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers

  validates :title, presence: true
  validates :body, presence: true

  def find_display_name(user_id)
    User.find_by(id: user_id).display_name
  end

  def find_answers_for_question(question_id)
    Answer.where(question_id: question_id).count
  end

  def find_taggings_for_question(question_id)
    Taggings.where(question_id: question_id)
  end

  def find_author_reputation(user_id)
    User.find_by(id: user_id).votes.count
  end

  def find_votes_for_question
    counter = 0
    self.votes.each do |vote|
      counter += vote.value
    end
    counter
  end
end
