context("Beat the champion!")

# Put your bot as the champion and the champion as the challenger.
# It sounds backwards but if you win then you get merged!

test_that("The champion is the best!", {

  set.seed(14)

  ngames <- 11
  results <- integer(length = ngames)

  starter <- sample(1:2, size = ngames, replace = TRUE)
  for (i in seq.int(ngames)) {

    champion <- sequencePlayer$new(rep(1:7, 6))
    challenger <- sequencePlayer$new(sample(1:7, size = 100, replace = TRUE))

    results[i] <- c4arena(champion, challenger, firstplayer = starter[i])
  }

  tally <- table(results)
  cat(tally, fill = TRUE)
  cat(results, fill = TRUE)

  expect_gt(tally[1], tally[2], label = "You didn't win this time. Dust yourself off and go again!")

})

