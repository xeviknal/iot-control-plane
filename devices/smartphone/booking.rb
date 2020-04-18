class Booking
  attr_accessor :user, :bike, :created_at, :canceled_at

  def initialize(user, bike)
    self.user = user
    self.bike = bike
    self.created_at = Time.now
  end

  # Todo: notify to API
  def save!
    self
  end

  def cancel!
    self.canceled_at = Time.now
  end

  def cancelled?
    !!self.canceled_at
  end
end
