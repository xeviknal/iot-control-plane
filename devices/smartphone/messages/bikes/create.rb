require './mqtt/client/messages/message'

class BikeCreateMessage < Message
  def topic
    'bike/create'
  end
end
