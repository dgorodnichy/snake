class Apple

  attr_accessor :x, :y

  def initialize(x, y)
    @image = Gosu::Image.new("resources/apple.png", :tileable => true)
    @x = x
    @y = y
  end

  def move
  end

  def draw
    @image.draw_rot(@x, @y, 0, 0)
  end
end

