class User < ActiveRecord::Base
  include BCrypt

  # Remember to create a migration!
  has_many :comments
  has_many :votes
  has_many :questions
  has_many :answers

  validates :display_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @new_password = new_password
    return unless new_password && new_password.length > 0
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def valid_new_password
    if @new_password.length == nil
      self.errors.add(:password, "must not be nil")
    end
  end

  def authenticate(user_password)
    password == user_password
  end


end
