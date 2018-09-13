require 'oystercard'

class Journey

  attr_reader :entry_station, :exit_station

  def initialize(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def fare
    return 6 if @entry_station == nil || @exit_station == nil
    Oystercard::MINIMUM_FARE
  end
end
