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

