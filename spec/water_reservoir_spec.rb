require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  it 'has a capacity and initial water volume' do
    reservoir = WaterReservoir.new(10, 5)
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'can be empty' do 
    reservoir = WaterReservoir.new(10, 0)
    expect(reservoir.empty?).to be true
  end

  it 'can be filled' do
    reservoir = WaterReservoir.new(10, 0)
    reservoir.fill
    expect(reservoir.current_water_volume).to eq(10)
  end

  it 'can drain water' do
    reservoir = WaterReservoir.new(10, 5)
    reservoir.drain(3)
    expect(reservoir.current_water_volume).to eq(2)
  end
  
end
