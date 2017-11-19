# tic-tac-toe

## Planning

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

### Victory check
- Player 1's squares = 1
- Player 2's squares = -1
- Winning line sums to 3 or -3.
- Only check lines affected by last turn?
