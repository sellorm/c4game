library(c4game)

context("c4repl tests")

test_that("that aan unnatended game runs properly", {
  expect_output(c4repl(0), "*Moves*")
})

test_that("incorrect start-up params are checked", {
  expect_identical(c4repl(3), "Error: number of players must be 0, 1 or 2")
  expect_identical(c4repl("test"), "Error: number of players must be 0, 1 or 2")
})
