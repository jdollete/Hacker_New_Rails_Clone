class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  has_secure_password

end
