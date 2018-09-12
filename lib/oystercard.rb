class Oystercard

  attr_reader :balance, :entry_station, :exit_station
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
    @entry_station = station
    fail 'Insufficient funds' if @balance < MINIMUM_FARE
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct(money)
    @balance -= money
  end
end
