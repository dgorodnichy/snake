class Snake
  attr_accessor :x, :y

  def initialize(length: 1, x: 320, y: 240)
    @image = Gosu::Image.new("resources/square.png", :tileable => true)
    @x = x
    @y = y
  end

  def move(direction: :right)
    case direction
    when :right
      @x += Game::STEP
    when :left
      @x -= Game::STEP
    when :up
      @y -= Game::STEP
    when :down
      @y += Game::STEP
    end
  end

  def draw
    @image.draw_rot(@x, @y, 0, 0)
  end
end

