# c4game

An R package to provide a simple model of the popular family game Connect 4.

## Installation

```
> source("https://install-github.me/sellorm/c4game")
```

## Usage

To play a 2 player game (both human) using the built in REPL:

```
c4repl()
```

To let the computer play itself in a random game:

```
playRandomGame()
```

```
To create your own game object to play with:

```
game <- c4game$new(board = matrix(, nrow = 6, ncol = 7), player = 1)
```

This creates a new object called game that you can then interact with.

The `game` object will have the following fields:

* **board** The current state of the game board
* **gamestate** Usually just set to 'next' but will report if a win is detected
* **player** The current player, 1 or 2

The `game` object only has one method, `dropToken`. It takes a single parameter, n where n is the number of the column the token should be dropped into.

For example:

```
game$dropToken(3)
```

Would drop a token into column 3 for the current user in `game$player`.

At this point, `game$board` will update and `game$gamestate` will report either `next` for "next move" or "Player 1 wins!", and `game$player` also updates to reflect the current player number, either 1 or 2.

# License

MIT © Mark Sellors
