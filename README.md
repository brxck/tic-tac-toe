# tic-tac-toe

## Planning

### Game Flow

- Draw board
- Player #'s turn
  - Input marker
  - Check if valid
  - Change marker
  - Check for win/draw
  - Flip player turn boolean
- ^Repeat until end game
- Display result
- Reset for new game

### Structure

- class Game --- responsible for game sequence
  - track player's current turn
  - prompt player for input
  - call victory check
  - call draw method after each turn
  - class Board --- responsible for board and victory states
    - store board state in 2D array
    - Board.update
    - Board.draw
    - Board.victory_check
  - class Player --- responsible for input and validation
    - Player.prompt

### Board object

- 2D array
- Ultimately containing Space objects
- Space = Struct.new(:number, :owner)

### Victory check

- Player 1's squares = 1
- Player 2's squares = -1
- Winning line sums to 3 or -3.
