class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }
  validates :password, presence: true, confirmation: true, length: { minimum: 4 }
  validates :nickname, presence: true

  before_create :encypt_password

  has_one :driver

  def encypt_password
    self.password = Digest::SHA1.hexdigest("a#{self.password}z")
  end

  def self.login(user)
    password = Digest::SHA1.hexdigest("a#{user[:password]}z")
    User.find_by(email: user[:email], password: password)
  end
end
