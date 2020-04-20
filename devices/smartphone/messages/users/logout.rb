require './mqtt/client/messages/message'

class UserLogoutMessage < Message
  def topic
    'user/logout'
  end
end
