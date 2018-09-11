class Oystercard

  attr_reader :balance, :checked_in
  MAXIMUM = 90

  def initialize
    @balance = 0
    @checked_in = false
  end

  def top_up(money)
    fail 'Unable to top up,maximum #{Oystercard::MAXIMUM} reached'if balance + money > MAXIMUM
      @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    @checked_in = true
  end

  def touch_out
    @checked_in = false
  end

  def in_journey?
    @checked_in
  end
end
