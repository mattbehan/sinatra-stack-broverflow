class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :answers

  def find_display_name(user_id)
    User.find_by(id: user_id).display_name
  end

  def find_answers_for_question(question.id)
    Answer.find_by(question_id: question.id).count
  end

  def find_taggings_for_question(question.id)
    Taggings.find_by(question_id: question_id)
  end
end
