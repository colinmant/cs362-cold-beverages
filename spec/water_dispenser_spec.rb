require_relative '../lib/water_dispenser'
require_relative '../lib/vessel'
require_relative '../lib/water_reservoir'


describe 'A water dispenser' do

  it 'has a reservoir' do
    reservoir = WaterReservoir.new(10, 5)
    dispenser = WaterDispenser.new(reservoir)
    expect(dispenser.reservoir).to eq(reservoir)
  end

  it 'fills a vessel' do
    reservoir = WaterReservoir.new(10, 5)
    vessel = Vessel.new('cup', 3)
    dispenser = WaterDispenser.new(reservoir)
    dispenser.dispense(vessel)
    expect(vessel.empty?).to be false
    expect(reservoir.current_water_volume).to eq(2)
  end
  
end
