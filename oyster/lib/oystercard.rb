class Oystercard

  attr_reader :balance, :checked_in
  MAXIMUM = 90
  MINIMUM_FARE = 2

  def initialize
    @balance = 0
    @checked_in = false
  end

  def top_up(money)
    fail 'Unable to top up,maximum #{Oystercard::MAXIMUM} reached'if balance + money > MAXIMUM
      @balance += money
  end



  def touch_in
    fail 'Insufficient funds' if @balance < 1
    @checked_in = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @checked_in = false
  end

  def in_journey?
    @checked_in
  end

  private

  def deduct(money)
    @balance -= money
  end
end
