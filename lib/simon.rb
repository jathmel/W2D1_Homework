class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1)
    @sequence_length = sequence_length
    @seq = []
    @game_over = false
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |el|
      puts el
      sleep 0.5
    end

  end

  def require_sequence
    # player_seq = []
    input = gets.chomp
    input.split(' ').map { |el| el }
  end

  def add_random_color
    rand_color = 1 + rand(4)
    @seq << COLORS[rand_color]
  end

  def round_success_message
    puts 'You got the squence correct'
  end

  def game_over_message
    puts 'Game over'
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end
