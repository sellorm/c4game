
#' Human player for c4
#'
#' @field name character.
#'
#' @export
#'
#' @examples
#' human$new(name="Mark")
human <- setRefClass(
  "human",

  fields = list(
    name = "character"),

  )

#' Make a human move
#'
#' Print the board and give a prompt
#'
#' @name human_make_move
#' @param board matrix from game
#' @param lastMove the laste move made
#' @return the player's move
NULL
human$methods(
  make_move = function(board, lastMove) {
    print(board)
    c4prompt <- paste0("Player ", name, ": ")
    userInput <- readline(c4prompt)
    userInput
  })

#' Let the player know the move was rejected
#'
#' @name human_rejected
#' @param board matrix from game
#' @param lastMove the laste move made
#' @return the player's new move
NULL
human$methods(
  rejected = function(board, lastMove) {
    message("Move rejected in position:", lastMove, "try again")
    make_move(board, lastMove)
  })
