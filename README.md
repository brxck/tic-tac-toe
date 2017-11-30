# tic-tac-toe

This is a project for [The Odin Project: OOP.](https://www.theodinproject.com/courses/ruby-programming/lessons/oop)

Command line implementation of tic-tac-toe in Ruby.

```
>$ ruby main.rb

  1    2    3  

  4    5    6  

  7    8    9  

Player 1, pick a square: 1

      ...

  X    2    O  

  O    X    6  

  7    8    X  

Player 2 wins!

Player 1: 0 | Player 2: 1
```

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
