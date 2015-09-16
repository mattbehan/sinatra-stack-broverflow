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
    Answer.find_by(question_id: question.id).count
  end

  def find_taggings_for_question(question_id)
    Taggings.find_by(question_id: question_id)
  end
end
