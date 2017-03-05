library(c4game)

context("main c4game object")

test_that("the board is initialised properly", {
  game <- c4game$new()
  expect_that(game$board, is_a("matrix"))
  expect_equal(ncol(game$board), 7)
  expect_equal(nrow(game$board), 6)
  # non standard board sizes
  game <-
    c4game$new(board = matrix(NA_integer_, ncol = 10, nrow = 8))
  expect_equal(ncol(game$board), 10)
  expect_equal(nrow(game$board), 8)
})

test_that("a player can properly drop a token", {
  game <- c4game$new()
  game$dropToken(3)
  expect_equal(game$board[6, 3], 1)
  game$dropToken(3)
  expect_equal(game$board[5, 3], 2)
  game$dropToken(2)
  expect_equal(game$board[6, 2], 1)
})

test_that("player updates correctly", {
  game <- c4game$new()
  expect_equal(game$player, 1)
  game$dropToken(4)
  expect_equal(game$player, 2)
  game$dropToken(3)
  expect_equal(game$player, 1)
  expect_false(game$dropToken(8))
  expect_false(game$dropToken("e"))
  expect_equal(game$player, 1)
  game$dropToken(4)
  expect_equal(game$player, 2)
  game$dropToken(4)
  expect_equal(game$player, 1)
  game$dropToken(4)
  expect_equal(game$player, 2)
  game$dropToken(4)
  expect_equal(game$player, 1)
  game$dropToken(4)
  expect_equal(game$player, 2)
  game$dropToken(4)
  expect_equal(game$player, 2)
})


test_that("gamestate updates correctly", {
  game <- c4game$new()
  game$dropToken(4)
  game$dropToken(3)
  game$dropToken(4)
  expect_equal(game$gamestate, "next")
  game$dropToken(3)
  expect_null(game$getWinner())
  game$dropToken(4)
  game$dropToken(3)
  expect_equal(game$gamestate, "next")
  game$dropToken(4)
  expect_equal(game$gamestate, "player 1 wins")
  expect_equal(game$getWinner(), 1)
})

test_that("we can correctly set player and state", {
  game <- c4game$new()
  expect_equal(game$player, 1)
  expect_equal(game$gamestate, "next")
  game$setPlayer(2)
  expect_equal(game$player, 2)
  game$setState("teststate")
  expect_equal(game$gamestate, "teststate")
})

test_that("a stalemate is properly reported", {
  stalemateBoard <- matrix(c(1, 2, 1, 2, 1, 1, 2,2,2,1,1,2,1,2,2,2,1,2,1,2,1), ncol= 7, nrow = 6)
  stalemateBoard[1,4] <- NA
  game <- c4game$new(board = stalemateBoard)
  game$dropToken(4)
  expect_equal(game$gamestate, "stalemate")
  expect_equal(game$getWinner(), 0)
})
