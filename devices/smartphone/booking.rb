class Booking
  attr_accessor :user, :bike, :created_at

  def initialize(user, bike)
    self.user = user
    self.bike = bike
    self.created_at = Time.now
  end

  # Todo: notify to API
  def save!
    self
  end
end
