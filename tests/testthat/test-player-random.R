library(c4game)

context("player-random tests")

test_that("that an unattended game runs properly", {
  game <- c4game$new()
  p1 <- randomPlayer$new()
  move <- p1$make_move(game$board, 1)
  expect_lte(move, 7)
  move <- p1$make_move(game$board, 1)
  expect_lte(move, 7)
  move <- p1$make_move(game$board, 1)
  expect_lte(move, 7)
  move <- p1$make_move(game$board, 1)
  expect_lte(move, 7)
  move <- p1$make_move(game$board, 1)
  expect_lte(move, 7)
})

