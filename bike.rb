class Bike
  attr_accessor :plate_no, :locked, :rides_count, :last_ride_at, :last_ride_end_at

  def initialize(plate_no)
    self.plate_no = plate_no
    self.rides_count = 0
    self.locked = true
  end

  def to_s
    self.plate_no + ":" + self.status
  end

  def status
    self.locked ? "Locked" : "Unlocked"
  end

  def lock
    raise 'Bike already locked' unless !self.locked
    self.locked = true
  end

  def unlock
    raise 'Bike already unlocked' unless self.locked
    self.locked = false
  end

  def increase_counter
    self.rides_count = self.rides_count + 1
  end

  def start_timer
    self.last_ride_at = Time.now
  end

  def stop_timer
    self.last_ride_end_at = Time.now
  end

  def start_ride
    self.increase_counter
    self.start_timer
    self.unlock
  end

  def finish_ride
    self.stop_timer
    self.lock
  end
end

b = Bike.new "8586 KXK"
b.start_ride
sleep 5
p b.to_s
b.finish_ride
p b.last_ride_end_at - b.last_ride_at
p b.to_s
