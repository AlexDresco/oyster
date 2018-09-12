class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journey_history
  MAXIMUM = 90
  MINIMUM_FARE = 2

  def initialize
    @balance = 0
    @journey_history = {}
  end

  def top_up(money)
    fail 'Unable to top up,maximum #{Oystercard::MAXIMUM} reached'if balance + money > MAXIMUM
    @balance += money
  end

  def touch_in(station)
    @entry_station = station
    journey_history[:starting_station] = @entry_station
    fail 'Insufficient funds' if @balance < MINIMUM_FARE
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    journey_history[:exit_station] = @exit_station
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct(money)
    @balance -= money
  end
end
