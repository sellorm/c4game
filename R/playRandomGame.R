#' Plays a random game of connect 4.
#'
#' @param verbose = FALSE
#' @examples
#' playRandomGame()
#' Player 2 Wins!
#' Moves: 25
playRandomGame <- function(verbose = FALSE){
  game <- c4game$new(board = matrix(, nrow = 6, ncol = 7), player = 1)
  randomColumn <- function(){
    return(sample(1:7, 1))
  }
  counter <- 0
  while( TRUE ){
    counter <- counter + 1
    move <- randomColumn()
    if(verbose == TRUE){ cat("Player", game$player, ": ", move, "\n") }
    game$dropToken(move)
    if( game$gamestate != "next" ){
      cat(game$gamestate,"\n")
      cat("Moves: ", counter, "\n")
      break
    }
  }
}
