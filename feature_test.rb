# <!-- In order to use public transport
# As a customer
# I want money on my card -->

load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.balance == 0

# In order to keep using public transport
# as a customer
# I want to add money to my card -->
oystercard.top_up(10)
oystercard.balance == 10
# true

# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit of 90 on my card
 oystercard.top_up(81)
 # raise_error
oystercard.deduct(1)
oystercard.balance == 9
#
# In order to get through the barriers.
# As a customer
# I need to touch in and out.

load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.touch_in == 'in'
# status = 'in'
oystercard.in_journey? == true
# True
oystercard.touch_out
# @status = 'out'
oystercard.in_journey? == false
# false

# In order to pay for my journey
# As a customer
# I need to have the minimum amount (£1) for a single journey.
load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.top_up(0.99)
oystercard.touch_in #return raise_error
oystercard.top_up(0.01)
oystercard.touch_in == true

# In order to pay for my journey
# As a customer
# When my journey is complete, I need the correct amount deducted from my card

load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.top_up(20)
MINIMUM_FARE = 2
oystercard.touch_out
oystercard.balance == 18

# In order to pay for my journey
# As a customer
# I need to know where I've travelled from

load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.touch_in("Barbican")
oystercard.station == "Barbican"
# to return departing station
