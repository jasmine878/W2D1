require "io/console"

# similar to a dictionary
KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

DIFF = {
  left: [0, -1],        #update the cursor position [0,0] by [0, -1]
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    board[cursor_pos].highlight
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    case key
    when :space
        return @cursor_pos
    when :left
        update_pos(DIFF[:left])
    when :down
        update_pos(DIFF[:down])
    when :up
        update_pos(DIFF[:up])
    when :right
        update_pos(DIFF[:right])
    when :tab
    when :return
        return @cursor_pos
    when :newline
    when :escape
    when :backspace
    when :delete
    when :ctrl_c
        Process.exit(0)
        # it is control + c.  it exits the current process.
    end
  end

  def update_pos(diff)
    board[cursor_pos].unhighlight # Piece/NullPiece

    #with each differential, one will be [0,0]
    # @cursor_pos[0] += diff[0] #moves rows 0
    @cursor_pos[0] = (@cursor_pos[0] + diff[0]) % 8
    @cursor_pos[1] = (@cursor_pos[1] + diff[1]) % 8
    # @cursor_pos[1] += diff[1] #moves columns -1

    board[cursor_pos].highlight # Piece/NullPiece

    nil
    # case diff
    # when [0, -1]
    #     #curser_pos => [2, 3] curser changes to [2, 2]
    #     @curser_pos[1] += diff[1]
    #     # 3 += -1 == 2
    # when [0, 1]
    #     #cursor_pos moves columns which is [1]
    #     @cursor_pos[0] += diff[0]
    #     @cursor_pos[1] += diff[1]
    # when [-1, 0]
    #     #@cursor_pos moves rows whic is [0]
    #     @cursor_pos[0] += diff[0]
    # when [1, 0]
    #     @cursor_pos[0] += diff[0]
    # end
  end
end

