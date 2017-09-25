# require 'spec_helper', 'security_code' ...  *in ~\.rspec

describe SecurityCode do
  let(:keypad) { (1..9).to_a.freeze }

  it 'is available as described_class' do
    expect(described_class).to eq(SecurityCode)
  end

  it 'is a 9 characters array' do
    expect(keypad.size).to eq(9)
  end
end
