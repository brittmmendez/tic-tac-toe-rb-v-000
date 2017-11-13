
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  board[index] != " " && board[index] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
        move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
   counter = 0
   board.each do |mark|
     if mark == "X" || mark == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player(board)
    if turn_count(board)%2==0
      return "X"
    elsif turn_count(board)%2==1
      return "O"
    end
  end

def won?(board)
  WIN_COMBINATIONS.find do|w_combination|
    position_taken?(board, w_combination[1]) && board[w_combination[0]]==board[w_combination[1]] && board[w_combination[1]]==board[w_combination[2]]
    end
end

def full?(board)
  board.none? {|position| position=="" ||position==" "}
end

def draw?(board)
   !won?(board) && full?(board)
end

def over?(board)
  draw?(board) ||won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[1]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
  puts "Cat's Game!"
else
    puts "Congrats #{winner(board)}"
end
end
