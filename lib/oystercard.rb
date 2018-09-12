class Oystercard

  attr_reader :balance, :station
  MAXIMUM = 90
  MINIMUM_FARE = 2

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail 'Unable to top up,maximum #{Oystercard::MAXIMUM} reached'if balance + money > MAXIMUM
    @balance += money
  end

  def touch_in(station)
    @station = station
    fail 'Insufficient funds' if @balance < MINIMUM_FARE
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @station = nil
  end

  def in_journey?
    !!@station
  end

  private

  def deduct(money)
    @balance -= money
  end
end
# added to check git push works? 
