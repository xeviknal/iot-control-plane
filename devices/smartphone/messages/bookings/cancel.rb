require './mqtt/client/messages/message'

class BookingCancelMessage < Message
  def topic
    'booking/cancel'
  end
end
