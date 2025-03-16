require_relative '../lib/freezer'
require_relative '../lib/item'

describe 'A freezer' do
  let(:freezer) { Freezer.new}

  it 'can be created with a default capacity and room temp' do
    freezer = Freezer.new(100)
    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(Freezer::ROOM_TEMPERATURE)
  end

  it 'can be turned on and off' do
    freezer.turn_on
    expect(freezer.power).to eq(:on)
    freezer.turn_off
    expect(freezer.power).to eq(:off)
  end

  it 'can add items' do
    item = Item.new('Banana', 3)
    freezer.add(item)
    expect(freezer.contents).to include(item)
  end

  it 'calculates remaining capacity' do
    item1 = Item.new('Banana', 3)
    item2 = Item.new('Apple', 3)
    freezer.add(item1)
    freezer.add(item2)
    expect(freezer.remaining_capacity).to eq(94)
  end

  it 'sets the temperature level' do
    freezer.set_level(3)
    expect(freezer.temperature).to eq(Freezer::ROOM_TEMPERATURE - 3 * 10)
  end

end
