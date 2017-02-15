class User < ApplicationRecord
  has_secure_password

  has_many :todos, dependent: :destroy

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  def auth_token
    UserAuth.token(self)
  end
end
