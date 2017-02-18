#' Starts a simple REPL to play connect 4.
#' A wrapper for c4arena, c4repl allows you to play against R or a friend.
#'
#' @param players The number of human players, either 0, 1 or 2. default is 1.
#' @export
#' @examples
#' c4repl(0)
c4repl <- function(players = 1){
  if ( players == 2 ) {
    p1 <- human$new(name="1")
    p2 <- human$new(name="2")
  } else if ( players == 1 ){
    p1 <- human$new(name="1")
    p2 = randomPlayer$new(name="2")
  } else if ( players == 0 ){
    p1 = randomPlayer$new(name="1")
    p2 = randomPlayer$new(name="2")
  } else {
    return("Error: number of players must be 0, 1 or 2")
  }
  c4arena(p1, p2)
}
