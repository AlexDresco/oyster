require 'oystercard'

describe Oystercard do

  it "the balance should be 0 by default" do
    expect(subject.balance).to eq 0
  end

  it "Should initialize status to 'out' by default" do
    expect(subject.checked_in).to eq false
  end

  it "when we top up £10, add to balance" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  it "raises error when balance + top up amounts to a set limit" do
    allow(subject).to receive(:balance) {Oystercard::MAXIMUM}
    expect{subject.top_up(1)}.to raise_error('Unable to top up,maximum #{Oystercard::MAXIMUM} reached')
  end


    describe "#touch_in" do
      it 'Should raise an error if balance is bellow £1' do
        subject.top_up(0.99)
        expect { subject.touch_in }.to raise_error('Insufficient funds')
      end

    describe "Touch in with credit" do
      before(:each) do
        subject.top_up(20)
      end
       it 'touches in oystercard' do
         expect(subject.touch_in).to eq true
    end

   describe '#touch_out' do
     it 'touches out oystercard after touching in' do
       subject.touch_in
       expect(subject.touch_out).to eq false
     end

     it 'should deduct the minimum fare when checking out' do
       expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
       # expect(subject.touch_out).to eq (subject.top_up(2) - Oystercard::MINIMUM_FARE)
     end
   end

  describe '#in_journey' do
    it 'should return true when in journey' do
    subject.touch_in
    expect(subject.in_journey?).to eq true
    end
  end
end
end
end
