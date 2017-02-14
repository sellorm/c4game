#' A reference class to create a connect 4 game object.
#'
#' @field board A matrix.
#' @field y A character.
#' @field player A number
#' @return a reference class (RC/R5) object.
#' @examples
#' c4game$new(board = matrix(, nrow = 6, ncol = 7), player = 1)
#' returns an r5 object
c4game <- setRefClass("c4game",
                      fields = list(board = "matrix",
                                    gamestate = "character",
                                    player = "numeric"),
                      methods = list(
                        dropToken = function(colnum){
                          boardrows <- c(length(board[,1]):1)
                          for(boardrow in boardrows){
                            if( is.na(board[boardrow, colnum]) ){
                              board[boardrow, colnum] <<- player
                              if( any(rle(board[,colnum])$lengths >= 4) ||
                                  any(rle(board[boardrow,])$lengths >= 4) ||
                                  any(rle(board[row(board) - col(board) == colnum - boardrow ])$lengths >= 4) ||
                                  any(rle(board[row(board) + col(board) == colnum + boardrow ])$lengths >= 4)){
                                gamestate <<- paste("player", player, "wins")
                                player <<- 0
                              } else {
                                gamestate <<- "next"
                                if ( player == 1 ){ player <<- 2 } else { player <<- 1 }
                              }
                              break
                            }
                          }
                        },
                        setPlayer = function(x){ player <<- x },
                        setState = function(x){ gamestate <<- x }
                      )
)
