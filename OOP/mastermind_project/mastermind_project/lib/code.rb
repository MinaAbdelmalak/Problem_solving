class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs 
  def self.valid_pegs?(array)
    array.all? {|ele| POSSIBLE_PEGS.has_key?(ele.upcase)}
  end
  def initialize(array)
    if Code.valid_pegs?(array)
      @pegs = array.map(&:upcase)
    else
      raise "There is an error"
    end
  end
  def self.random(length)
    pegs = []
    length.times { pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end
  def self.from_string(str)
    colors_given = str.split("")
    Code.new(colors_given)
  end
  def [](idx)
    @pegs[idx]
  end
  def length
    @pegs.length
  end
  def num_exact_matches(guess)
    counter = 0
    (0...guess.length).each do |i|
      if guess.pegs[i] == self.pegs[i]
        counter += 1
      end
    end
    counter
  end
  # I have a problem here (duplications)
  def num_near_matches(guessed)
    counter = 0 
    (0...guessed.length).each do |idx|
      if guessed[idx] != self[idx] && self.pegs.include?(guessed[idx])
        counter += 1
      end
    end
    counter
  end
  def ==(guess)
    guess.pegs == self.pegs
  end
end
