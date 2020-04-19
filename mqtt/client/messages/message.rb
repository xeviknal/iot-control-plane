require './mqtt/client/mqtt_client'

class Message
  attr_accessor :topic, :payload, :created_at, :sent_at

  def initialize(payload)
    self.payload = payload
    self.created_at = Time.now
  end

  def topic
    raise NotImplementedError
  end

  def send!
    MQTTClient.client.publish(self.topic, self.payload)
    self.sent_at = Time.now
  end
end
