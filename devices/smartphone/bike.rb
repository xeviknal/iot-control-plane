class Bike
  attr_accessor :id, :plate_no, :is_available

  def initialize(id, plate_no)
    self.id = id
    self.plate_no = plate_no
    self.is_available = true
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
