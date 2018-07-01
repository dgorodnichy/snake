require 'gosu'
require './snake'
require './apple'

class Game < Gosu::Window

  HEIGHT = 480.freeze
  WIDTH = 640.freeze
  STEP = 2

  def initialize
    super WIDTH, HEIGHT
    self.caption = "Snake by DGorodichy"
    @snake = Snake.new()
    @apple = Apple.new(rand(640), rand(480))
    @direction = :right
  end

  def update
    change_direction
    exit if check_status
    @snake.move(direction: @direction)
  end

  def draw
    @snake.draw
    @apple.draw
  end

  def check_status
    (@apple.x-10 .. @apple.x+10).include?(@snake.x) && (@apple.y-10 .. @apple.y+10).include?(@snake.y)
  end

  def change_direction
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @direction = :left
    end

    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @direction = :right
    end

    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
      @direction = :up
    end

    if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
      @direction = :down
    end
  end
end

Game.new.show

