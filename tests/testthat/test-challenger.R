context("Beat the champion!")

# Put your bot as the champion and the champion as the challenger.
# It sounds backwards but if you win then you get merged!

test_that("The champion is the best!", {

  champion <- sequencePlayer$new(rep(1:7, 6))
  challenger <- randomPlayer$new()

  ngames <- 11
  results <- integer(length = ngames)

  starter <- sample(1:2, size = ngames, replace = TRUE)
  for (i in seq.int(ngames)) {
    results[i] <- c4arena(champion, challenger, firstplayer = starter[i])
  }

  tally <- table(results)

  expect_gt(tally[1], tally[2], message = "You didn't win this time. Dust yourself off and go again!")

})

