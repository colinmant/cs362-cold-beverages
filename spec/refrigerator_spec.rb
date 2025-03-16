require_relative '../lib/refrigerator'

describe 'A refrigerator' do
  let(:chiller) {Chiller.new}
  let(:freezer) {Freezer.new}
  let(:reservoir) {WaterReservoir.new}
  let(:dispenser) {WaterDispenser.new(reservoir)}
  let(:refrigerator) {Refrigerator.new(chiller, freezer, dispenser, reservoir)}

  it 'can be created' do 
    expect(refrigerator.chiller).to eq(chiller)
    expect(refrigerator.freezer).to eq(freezer)
    expect(refrigerator.water_reservoir).to eq(reservoir)
    expect(refrigerator.water_dispenser).to eq(dispenser)
  end

  it 'can add an item to the chiller' do
    item = Item.new('Banana', 3)
    refrigerator.chill(item)
    expect(chiller.remaining_capacity).to eq (97)
  end

  it 'can add an item to the freezer' do
    item = Item.new('Banana', 3)
    refrigerator.freeze(item)
    expect(freezer.remaining_capacity).to eq (97)
  end

  it 'can calculate the total capacity' do
    expect(refrigerator.total_capacity).to eq(chiller.remaining_capacity + freezer.remaining_capacity)
  end

  it 'can calculate the remaining capacity' do
    item1 = Item.new('Banana', 3)
    item2 = Item.new('Apple', 3)
    chiller.add(item1)
    freezer.add(item2)
    expect(refrigerator.remaining_capacity).to eq (chiller.remaining_capacity + freezer.remaining_capacity)
  end

  it 'can be plugged in or unplugged' do
    refrigerator.plug_in
    expect(refrigerator.power).to eq(:on)
    expect(chiller.power).to eq(:on)
    expect(freezer.power).to eq(:on)

    refrigerator.unplug
    expect(refrigerator.power).to eq(:off)
    expect(chiller.power).to eq(:off)
    expect(freezer.power).to eq(:off)
  end

  it 'can set the chiller level' do
    refrigerator.set_chiller_level(3)
    expect(chiller.temperature).to eq(Chiller::ROOM_TEMPERATURE - 3 * 5)
  end

  it 'can set the freezer level' do 
    refrigerator.set_freezer_level(3)
    expect(freezer.temperature).to eq(Freezer::ROOM_TEMPERATURE - 3 * 10)
  end

  it 'can be returned as string' do
    expect(refrigerator.to_s).to include("Power: #{refrigerator.power}")
    expect(refrigerator.to_s).to include("Storage: #{refrigerator.remaining_capacity} of #{refrigerator.total_capacity} available")
    expect(refrigerator.to_s).to include("Temps: Chiller is #{chiller.temperature}, Freezer is #{freezer.temperature}")
    expect(refrigerator.to_s).to include("Water: Reservoir has #{reservoir.current_water_volume} remaining.")
  end

end
