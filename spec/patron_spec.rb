require 'rspec'
require './lib/patron'

describe Patron do

  before(:each) do
    @patron_1 = Patron.new("Bob", 20)
  end

  it 'exists' do
    expect(@patron1).to be_a(Patron)
  end
  
end
