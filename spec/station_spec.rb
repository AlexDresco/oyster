require 'station'

describe Station do

  let(:station) {Station.new("Barbican","Zone 1")}

  it "should initialize with a name" do
    expect(station.name).to eq "Barbican"
  end

  it "should initialize with a zone" do
    expect(station.zone).to eq("Zone 1")
  end
end
