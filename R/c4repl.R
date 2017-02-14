#' Add together two numbers.
#'
#' @param x A number.
#' @param y A number.
#' @return The sum of \code{x} and \code{y}.
#' @examples
#' add(1, 1)
#' add(10, 1)
c4repl <- function(){
  # initialise the game
  game <- c4game$new(board = matrix(, nrow = 6, ncol = 7), player = 1)
  print(game$board)
  # start the game
  while(TRUE){
    c4prompt <- paste0("Player", game$player, "> ")
    userInput <- readline(c4prompt)
    if(userInput == "q"){break}
    game$dropToken(as.numeric(userInput))
    print(game$board)
    print(game$gamestate)
    if(game$gamestate != "next"){break}
  }
}
