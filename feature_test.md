# In order to use public transport
# As a customer
# I want money on my card

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

# In order to know where I have been
# As a customer
# I want to see all my previous trips

load './lib/oystercard.rb'
card = Oystercard.new
journey_history = {}
card.top_up(50)
card.touch_in("Barbican")
card.touch_out("Mile End")
journey_history == {starting_station: 'Barbican', exit_station: 'Mile end'}

# In order to know how far I have travelled
# As a customer
# I want to know what zone a station is in

load './lib/station.rb'
station = Station.new(name, zone)
station.name
station.zone

# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out
load './lib/journey.rb'
journey = Journey.new("station.new1", "station.new2")
journey.entry_station("barbican")
#it returns entry station
journey.exit_station("barbican")
#it returns exit station
journey.fare(entry_station, exit_station)
#it calculates the fare of the journey
journey.history
journey.complete?
