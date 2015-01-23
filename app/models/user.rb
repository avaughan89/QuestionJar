require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many  :surveys
  has_many  :responses
  has_many  :questions, through: :responses


  # has_many  :responses
  # has_many :questions, through: :responses



  # has_secure_passwordbe rak
    # Remember to create a migration!

  # validates  :username, presence: true,
  #                       uniqueness: true

  # validates  :email, presence: true,
  #                     uniqueness: true
  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(password)
    @password ||= BCrypt::Password.create(password)
    self.password_hash = @password
  end
end
