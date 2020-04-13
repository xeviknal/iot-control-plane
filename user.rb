class User
  attr_accessor :id, :rides_count, :first_ride_at, :last_ride_at, :current_ride_start_at, :current_ride_end_at

  def initialize(id)
    self.id = id
    self.rides_count = 0
  end

  def start_ride
    self.first_ride_at = Time.now unless self.first_ride_at?
    self.last_ride_at = Time.now
    self.current_ride_start_at = Time.now
    self.rides_count = self.rides_count + 1
  end

  def finish_ride
    self.current_ride_end_at = Time.now
    self.locked
  end
end
