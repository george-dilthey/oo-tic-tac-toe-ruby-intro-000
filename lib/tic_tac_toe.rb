class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = (input.to_i) - 1
  end

  def move(index, token="X")
    @board[index] = token
    return @board
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    elsif @board[index] == "X" || "O"
      true
    end
  end

  def valid_move?(index)
    if index.between?(0,8)
      if !position_taken?(index)
        true
      end
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each { |pos|
      if pos == 'X' || pos == 'O'
        counter += 1
      end
    }
    return counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(board,index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end



end
