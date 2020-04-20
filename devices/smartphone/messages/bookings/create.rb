require './mqtt/client/messages/message'

class BookingCreateMessage < Message
  def topic
    'booking/create'
  end
end
