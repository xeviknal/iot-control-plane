require './mqtt/client/messages/message'

class UserLoginMessage < Message
  def topic
    'user/login'
  end
end
