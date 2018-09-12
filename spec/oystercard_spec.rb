require 'oystercard'

describe Oystercard do
  describe "#journey_history" do
    it "should initially create an empty journey history" do
      expect(subject.journey_history).to eq({})
    end

    it "should store the journey history check-ins and outs" do
      subject.top_up(20)
      subject.touch_in(@entry_station)
      subject.touch_out(@exit_station)
      expect(subject.journey_history).to eq({starting_station: @entry_station, exit_station: @exit_station})
    end
  end

  describe "#balance" do
    it "the balance should be 0 by default" do
      expect(subject.balance).to eq 0
    end

    it "when we top up £10, add to balance" do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
  end

  describe "#top_up" do
    it "raises error when balance + top up amounts to a set limit" do
      allow(subject).to receive(:balance) {Oystercard::MAXIMUM}
      expect{subject.top_up(1)}.to raise_error('Unable to top up,maximum #{Oystercard::MAXIMUM} reached')
    end
  end

  describe "#touch_in" do
    it 'Should raise an error if balance is bellow £1' do
      subject.top_up(0.99)
      expect { subject.touch_in(@entry_station) }.to raise_error('Insufficient funds')
    end
  end

  describe '#station' do
    it 'returns the departure station when touched in' do
      subject.top_up(20)
      subject.touch_in(@entry_station)
      expect(subject.entry_station).to eq(@entry_station)
    end
  end

  describe '#touch_out' do
    it 'touches out oystercard after touching in' do
      subject.top_up(20)
      subject.touch_in(@entry_station)
      subject.touch_out("Mile End")
      expect(subject.exit_station).to eq ('Mile End')
    end

    it 'should deduct the minimum fare when checking out' do
      expect { subject.touch_out('Mile End') }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
    end
  end

  describe '#in_journey?' do
    it 'should return true when in journey' do
      subject.top_up(20)
      @entry_station = "Barbican"
      subject.touch_in(@entry_station)
      expect(subject.in_journey?).to eq true
    end
  end

end
