require './mqtt/client/messages/message'

class BeepMessage < Message
  def topic
    'bike/beep'
  end
end
