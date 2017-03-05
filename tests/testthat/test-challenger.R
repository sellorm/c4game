context("Beat the champion!")

# Put your bot as the challenger and the champion as the old challenger.
# It sounds backwards but if you win then you get merged!

test_that("The champion is the best!", {

  set.seed(14)

  ngames <- 101
  results <- integer(length = ngames)

  starter <- sample(1:2, size = ngames, replace = TRUE)
  for (i in seq.int(ngames)) {

    challenger <- c4dougbot2000::dougbot2000$new()
    champion <- randomPlayer$new()

    results[i] <- c4arena(champion, challenger, firstplayer = starter[i])
  }

  tally <- table(results)
  print(tally)

  expect_gt(tally["2"], tally["1"], label = "You didn't win this time. Dust yourself off and go again!")

})

