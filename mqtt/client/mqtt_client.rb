require 'rubygems'
require 'mqtt'

class MQTTClient
  def self.client
    @client ||= MQTT::Client.connect(host: '192.168.56.12', port: 1883)
  end
end
