#' A reference class to create a connect 4 game object.
#'
#' @field board A matrix.
#' @field y A character.
#' @field player A number
#' @return a reference class (RC/R5) object.
#' @export c4game
#' @exportClass c4game
#' @examples
#' c4game$new(board = matrix(, nrow = 6, ncol = 7), player = 1)
#' # object instatiation returns an r5 object
#'
#' @importFrom methods new
c4game <- setRefClass(
  "c4game",
  fields = list(
    board = "matrix",
    gamestate = "character",
    player = "numeric"
  ),
  methods = list(
    dropToken = function(colnum) {
      # need the height of the board in case a non-standard size is specified
      boardwidth <- length(board[1,])
      boardheight <- length(board[,1])
      boardrows <- c(boardheight:1)
      boardcols <- c(1:boardwidth)
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
        if (is.na(board[boardrow, colnum])) {
          board[boardrow, colnum] <<- player
          # check all directions through the placed token for 4 in a row.
          if (any(rle(board[, colnum])$lengths >= 4) ||
              any(rle(board[boardrow, ])$lengths >= 4) ||
              any(rle(board[row(board) - col(board) == colnum - boardrow])$lengths >= 4) ||
              any(rle(board[row(board) + col(board) == colnum + boardrow])$lengths >= 4)) {
            # update the gamestate with player winner
            gamestate <<-
              paste("player", player, "wins")
            player <<- 0
          } else {
            gamestate <<- "next"
            if (player == 1) {
              player <<- 2
            } else {
              player <<- 1
            }
          }
          # break
          return(TRUE)
        }
      }
    },
    setPlayer = function(x) {
      player <<- x
    },
    setState = function(x) {
      gamestate <<- x
    }
  )
)
