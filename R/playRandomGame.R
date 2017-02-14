#' Add together two numbers.
#'
#' @param x A number.
#' @param y A number.
#' @return The sum of \code{x} and \code{y}.
#' @examples
#' add(1, 1)
#' add(10, 1)
playRandomGame <- function(verbose = FALSE){
  game <- c4game$new(board = matrix(, nrow = 6, ncol = 7), player = 1)
  randomColumn <- function(){
    return(sample(c(1:7), 1))
  }
  counter <- 0
  while( TRUE ){
    counter <- counter + 1
    move <- randomColumn()
    if(verbose == TRUE){ cat(paste("Player", game$player, ": ", move, "\n")) }
    game$dropToken(move)
    if( game$gamestate != "next" ){
      cat(game$gamestate,"\n")
      cat("Moves: ", counter, "\n")
      break
    }
  }
}
