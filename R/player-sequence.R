#' Random player for c4
#'
#' Give the bot the sequence and it will make the moves. Cyclic repetition means
#' it never runs out of ideas.
#'
#' @field name character. Name of the bot
#' @field moveSeq numeric. The sequence of moves. Should be column indexes
#' @field moveCnt numeric. Private. Where you are in the sequence
#'
#' @export sequencePlayer
#' @exportClass sequencePlayer
#'
#' @examples
#' sequencePlayer$new(moveSeq = 1:6, name="SequenceBot1")
#'
sequencePlayer <- setRefClass(
  "sequencePlayer",

  fields = list(
    moveSeq = "numeric",
    moveCnt = "numeric",
    name = "character"),

  methods = list(
    initialize=function(moveSeq = rep(1:7,each = 6), name = "seqbot") {
      .self$moveSeq <- moveSeq
      .self$moveCnt <- 0
      .self$name <- name
    },

    make_move = function(board, lastMove) {
      .self$moveCnt <- .self$moveCnt + 1
      # Cyclic repeat the sequence
      return(moveSeq[(.self$moveCnt-1) %% length(moveSeq) + 1])
    },

    rejected = function(board, lastMove) {
      make_move(board, lastMove)
    })
)
