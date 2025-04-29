#' Convert a list of palette objects to a data frame
#'
#' Converts a list of palettes objects to a data frame to have palette
#' information in a more convenient format.
#'
#' @param pal_list A list of palettes.
#' @return A data frame with 3 variables:
#' * name: palette name
#' * type: continuous or discrete
#' * colourblind_friendly: a logical value indicating if the palette
#'   is colour blind friendly
#' @noRd
palette_data_frame <- function(pal_list) {
  l <- lapply(palettes, function(pal) pal[!names(pal) %in% "palette"])
  pal_data <- data.frame(
    name = names(pal_list),
    do.call(rbind.data.frame, l)
  )
  rownames(pal_data) <- NULL
  pal_data
}

#' Get information on available palettes
#'
#' Returns a data frame with the names and information on the palettes
#' that are available in the package.
#'
#' @return A data frame with 3 variables:
#' * name: palette name
#' * type: continuous or discrete
#' * colourblind_friendly: a logical value indicating if the palette
#'   is colour blind friendly
#' @examples
#' lepidochroma_palettes()
#'
#' @export
lepidochroma_palettes <- function() {
  palette_data_frame(palettes)
}
