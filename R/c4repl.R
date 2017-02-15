#' Starts a simple REPL to play connect 4.
#'
#' @export
#' @examples
#' c4repl()
#' # Player1>
c4repl <- function(){
  # initialise the game
  game <- c4game$new(board = matrix(, nrow = 6, ncol = 7), player = 1, gamestate = "next")
  print(game$board)
  # start the game
  while(TRUE){
    c4prompt <- paste0("Player", game$player, "> ")
    userInput <- readline(c4prompt)
    if(userInput == "q"){break}
    game$dropToken(userInput)
    print(game$board)
    print(game$gamestate)
    if(game$gamestate != "next"){break}
  }
}
