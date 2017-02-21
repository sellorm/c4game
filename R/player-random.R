#' Random player for c4
#'
#' @field name character.
#'
#' @export randomPlayer
#' @exportClass randomPlayer
#'
#' @examples
#' randomPlayer$new(name="Bot1")
#'
randomPlayer <- setRefClass(
  "randomPlayer",

  fields = list(
    name = "character"),

  methods = list(
    make_move = function(board, lastMove) {
      return(sample(1:ncol(board), 1))
    },

    rejected = function(board, lastMove) {
      make_move(board, lastMove)
    })
)
