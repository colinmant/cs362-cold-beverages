require_relative '../lib/chiller'
require_relative '../lib/item'

describe 'A chiller' do
  let(:chiller) {Chiller.new} 

  it 'can be created with a default capacity and room temp' do
    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(Chiller::ROOM_TEMPERATURE)
  end

  it 'can be turned on and off' do
    chiller.turn_on
    expect(chiller.power).to eq(:on)
    chiller.turn_off
    expect(chiller.power).to eq(:off)
  end

  it 'can add items' do
    item = Item.new('Banana', 3)
    chiller.add(item)
    expect(chiller.contents).to include(item)
  end

  it 'can calculate the remaining capacity' do
    item1 = Item.new('Banana', 3)
    item2 = Item.new('Apple', 3)
    chiller.add(item1)
    chiller.add(item2)
    expect(chiller.remaining_capacity).to eq(94)
  end

  it 'can set the temperature level' do
    chiller.set_level(3)
    expect(chiller.temperature).to eq(Chiller::ROOM_TEMPERATURE - 3 * 5)
  end

end
