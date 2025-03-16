require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  let(:reservoir) {WaterReservoir.new(10, 5)}
  
  it 'has a capacity and initial water volume' do
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'can be empty or not' do 
    reservoir = WaterReservoir.new(10, 0)
    expect(reservoir.empty?).to be true
    reservoir = WaterReservoir.new(10, 5)
    expect(reservoir.empty?).to be false
  end

  it 'can be filled' do
    reservoir.fill
    expect(reservoir.current_water_volume).to eq(10)
  end

  it 'can drain water' do
    reservoir.drain(3)
    expect(reservoir.current_water_volume).to eq(2)
  end

end
