require 'spec_helper'
require './mqtt/client/messages/message'
require './mqtt/client/mqtt_client'

describe Message do
  let(:message) { Message.new 'Hello World!' }

  describe '.new' do
    subject { message }
    it 'adds a creation_at timestamp' do
      expect(message.created_at).not_to be_nil
    end
  end

  ['send!', 'topic'].each do |mtd|
    describe mtd do
      it { expect { message.send mtd }.to raise_error NotImplementedError }
    end
  end
end

class TestMessage < Message
  def topic
    :test
  end
end

describe TestMessage do
  let(:message) { TestMessage.new 'Hello World' }

  describe '.send!' do
    let(:time) { Time.mktime(2020,04,19) }
    let(:client) { MQTT::Client.new }
    let(:payload) { 'Hello World' }

    before do
      expect(Time).to receive(:now).and_return(time).exactly(4).times
      expect(MQTTClient).to receive(:client).and_return(client).once
      expect(client).to receive(:publish).with(:test, payload).once

      message.send!
    end

    it 'sends a message to MQTT topic' do
      expect(message.payload).to eq 'Hello World'
    end

    it 'registers the sent_at time' do
      expect(message.sent_at).to eq time
    end
  end
end
