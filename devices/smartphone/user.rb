require './devices/smartphone/messages/users/login'
require './devices/smartphone/messages/users/logout'

class User
  attr_accessor :email, :last_login_at, :last_logout_at

  def initialize(email)
    self.email = email
  end

  def message_id
    self.email
  end

  def login
    UserLoginMessage.new(message_id).send!
    self.last_login_at = Time.now
  end

  def logout
    UserLogoutMessage.new(message_id).send!
    self.last_logout_at = Time.now
  end
end
