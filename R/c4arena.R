

#' Pit two players in a game of c4!
#'
#' @param player1 Either an instance of a reference class or a reference class generator
#' @param player2 Either an instance of a reference class or a reference class generator
#' @param nrow Number of rows for the board
#' @param ncol Number of columns for the board
#' @param firstplayer numeric. 1 or 2, which player goes first?
#'
#' @return The game winner number. 1 or 2.
#' @export
#'
#' @examples
#' c4arena(randomPlayer, randomPlayer)
#'
#' p1 <- randomPlayer$new()
#' p2 <- randomPlayer$new()
#' c4arena(p1, p2)
#'
#' \dontrun{
#' p1 <- randomPlayer$new(name = "Bob")
#' p2 <- human$new(name = "Alice")
#' c4arena(p1, p2)
#' }
c4arena <- function(player1, player2, nrow = 6, ncol = 7, firstplayer = 1) {

  game <- c4game$new(board = matrix(NA_integer_, nrow = nrow, ncol = ncol),
                     player = firstplayer)

  # If it's a class generator create an instance
  if(any(c("R6ClassGenerator", "refObjectGenerator") %in% class(player1))) {
    player1 <- player1$new(name = "player1")
  }

  if(any(c("R6ClassGenerator", "refObjectGenerator") %in% class(player2))) {
    player2 <- player2$new(name = "player2")
  }

  # So that we can flip between them
  players <- list(player1, player2)

  move <- NULL
  counter <- 0
  while( TRUE ){
    counter <- counter + 1
    p <- game$player

    move <- players[[p]]$make_move(game$board, move)
    if (move == "q") {break}

    game$dropToken(move)
    if( game$gamestate != "next" ){
      #cat(game$gamestate,"\n")
      #cat("Moves: ", counter, "\n")
      break
    }
  }

  game$getWinner()

}
