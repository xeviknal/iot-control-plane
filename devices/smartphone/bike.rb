require './devices/smartphone/messages/bikes/create'
require './devices/smartphone/messages/bikes/beep'

class Bike
  attr_accessor :id, :plate_no, :is_available, :last_beep_at, :created_at

  def initialize(id, plate_no)
    self.id = id
    self.plate_no = plate_no
    self.is_available = true
  end

  def message_id
    "#{self.id}/#{self.plate_no}"
  end

  def save!
    BikeCreateMessage.new(message_id).send!
    self.created_at = Time.now

    self
  end

  def beep
    BeepMessage.new(message_id).send!
    self.last_beep_at = Time.now
  end

  def self.available
    [
      Bike.new(1, "8586KXK"),
      Bike.new(2, "4522CVZ"),
      Bike.new(3, "4422CVZ"),
      Bike.new(4, "8687KXK"),
    ]
  end
end
