class Board
    attr_reader :size
  def initialize (number)
    @grid = Array.new(number, :N){Array.new(number, :N)}   
    @size = number * number
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end
  def []= (position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    count = 0
    @grid.each do |array|
        array.each do |ele|
           count += 1  if ele == :S
        end
    end
    count
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "You sunk mu battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    quarter = 0.25 * self.size
    while self.num_ships < quarter 
      row = rand(0...@grid.length)
      column = rand(0...@grid.length)
      position = [row, column]
      self[position] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          :N
        else
          ele
        end
      end
    end
  end
  
  def self.print_grid(arr)
    arr.each do |row|
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end
  
  def print
    Board.print_grid(hidden_ships_grid)
  end
end
