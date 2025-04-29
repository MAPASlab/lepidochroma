#' Colour palettes inspired by butterflies
#'
#' Returns a colour palette from the `lepidochroma` collection.
#'
#' @param name Palette name (see the `name` column in the data frame
#'   returned by `lepidochroma_palettes()` for a list of available
#'   options).  This argument is case insensitive.
#' @param n Number of colours to return.  It is an optional argument:
#'   if it is not specified, all available colours for the specified
#'   palette will be returned.  For continuous palettes (see the
#'   output of `lepidochroma_palettes()`) this parameter can take any
#'   number >= 2.  For discrete palettes, its maximum value is limited
#'   to their number of colours.
#' @return A character vector with colours as hexadecimal strings.
#'
#' @examples
#' # Discrete palette
#' lepidochroma("attacus", 4)
#' # Continuous palette
#' lepidochroma("morpho", 30)
#' 
#' @importFrom grDevices colorRampPalette
#' @export
lepidochroma <- function(name, n = NULL) {
  name <- tolower(name) # Case insensitive
  pal <- palettes[[name]]

  if (is.null(pal)) {
    stop("Invalid palette name")
  }

  pal_type <- pal$type
  max_col <- length(pal$palette)
  if (is.null(n)) {
    n <- max_col
  }

  if (n < 2) {
    stop("'n' (number of colours) should be >= 2")
  }

  if (pal_type == "discrete") {
    if (n > max_col) {
      stop(
        "Number of colours in ", name,
        " palette should be between 2 and ", max_col
      )
    }
    col_list <- pal$palette[seq_len(n)]
  } else {
    col_list <- colorRampPalette(pal$palette)(n)
  }

  col_list
}
