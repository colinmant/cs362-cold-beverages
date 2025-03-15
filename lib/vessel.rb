class Vessel
  attr_reader :name, :volume

  def initialize(name, volume)
    @name = name
    @volume = volume
    @contents = 0
  end

  def empty?
    @contents == 0
  end

  def fill
    @contents = @volume
  end
end
