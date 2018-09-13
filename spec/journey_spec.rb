require 'journey'
require 'oystercard'

describe Journey do

  let(:entry_station){double(:station)}
  let(:exit_station){double(:station)}
  subject {Journey.new(entry_station, exit_station)}

  it "should initialise with entry instance variables" do
    expect(subject.entry_station).to eq(entry_station)
  end

  it "should initialise with exit instance variables" do
    expect(subject.exit_station).to eq(exit_station)
  end
  describe "#fare" do
    it "return minimum fare unless not checking or out" do
      expect(subject.fare).to eq Oystercard::MINIMUM_FARE
    end

    it "return penalty fare if not checked in" do
      journey = Journey.new(nil, exit_station)
      expect(journey.fare).to eq 6
    end

    it "return penalty fare if not checked out" do
      journey = Journey.new(entry_station, nil)
      expect(journey.fare).to eq 6
    end

  end
end
