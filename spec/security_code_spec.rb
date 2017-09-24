require 'spec_helper'

describe SecurityCode do

  let(:KEYPAD) { (1..9).to_a.freeze }

  it 'is a 9 characters array' do
    expect(KEYPAD).to have(9).characters
  end
end
