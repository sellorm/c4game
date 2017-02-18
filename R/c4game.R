#' A reference class to create a connect 4 game object.
#'
#' @field board A matrix.
#' @field y A character.
#' @field player A number
#' @return a reference class (RC/R5) object.
#' @export c4game
#' @examples
#' game <- c4game$new()
#' game <- c4game$new(board = matrix(, nrow = 6, ncol = 7))
#' # object instatiation returns an R6 object
#'
#' @importFrom methods new
#' @import R6
c4game <- R6Class(
  "c4game",
  public = list(
    board = "matrix",
    gamestate = "character",
    player = "numeric",
    initialize = function(board, gamestate, player = 1){
      if (!missing(board)) self$board = matrix(NA, nrow = 6, ncol = 7)
      self$gamestate = "next"
      self$player = player
    },
    dropToken = function(colnum) {
      # need the height of the board in case a non-standard size is specified
      boardwidth <- ncol(self$board)
      boardheight <- nrow(self$board)
      boardrows <- boardheight:1
      boardcols <- 1:boardwidth
      tryCatch({
        colnum <- as.numeric(colnum)
        is.numeric(colnum)
      }, warning = function(w) {
        return(FALSE)
      }, error = function(e) {
        return(FALSE)
      })
      if ( any(boardcols==colnum)==FALSE ){
        return()
      }
      # Check each row in reverse to see if it's empty
      for (boardrow in boardrows) {
        # Place the token in the first empty slot
        if (is.na(self$board[boardrow, colnum])) {
          self$board[boardrow, colnum] = self$player
          # check all directions through the placed token for 4 in a row.
          if (any(rle(self$board[, colnum])$lengths >= 4) ||
              any(rle(self$board[boardrow, ])$lengths >= 4) ||
              any(rle(self$board[row(self$board) - col(self$board) == colnum - boardrow])$lengths >= 4) ||
              any(rle(self$board[row(self$board) + col(self$board) == colnum + boardrow])$lengths >= 4)) {
            # update the gamestate with player winner
            self$gamestate =
              paste("player", self$player, "wins")
          } else {
            self$gamestate <<- "next"
            if (self$player == 1) {
              self$player <<- 2
            } else {
              self$player <<- 1
            }
          }
          return(TRUE)
        }
      }
    },
    setPlayer = function(x) {
      self$player = x
    },
    setState = function(x) {
      self$gamestate = x
    },
    getWinner = function() {
      if ( self$gamestate != "next" ){
        return(self$player)
      } else {
        return(NULL)
      }
    }
  )
)
