#' Display all colour palettes
#'
#' Plots all available colour palettes.  The arguments allow to
#' display only discrete, continuous, or colour blind friendly
#' palettes.
#'
#' @param n The number of colours to display.  Should always be >= 2.
#' @param type The type of palettes to be displayed (`"all"`,
#'   `"discrete"`, or `"continuous"`).
#' @param colourblind_only A logical value.  If `TRUE`, display only
#'   colour blind friendly palettes.
#'
#' @importFrom graphics par rect text
#' @noRd
lepidochroma_display_all <- function(n = NULL,
                                     type = c("all", "discrete", "continuous"),
                                     colourblind_only = FALSE) {
  type <- match.arg(type)
  if (type == "all") {
    type <- c("discrete", "continuous")
  }

  pal_data <- lepidochroma_palettes()
  sel <- pal_data$type %in% type
  if (colourblind_only) {
    sel <- sel & pal_data$colourblind_friendly
  }
  selected_pal <- pal_data$name[sel]
  pal <- palettes[names(palettes) %in% selected_pal]

  n_col <- sapply(pal, function(p) length(p$palette))
  n_pal <- length(pal)

  if (!is.null(n)) {
    if (identical(type, "continuous")) {
      n_col <- rep(n, n_pal)
    } else {
      n_col <- pmin(n, n_col)
    }
  }

  # Empty plot
  opar <- par(mar = c(3, 6, 3, 2) + 0.1)
  on.exit(par(opar), add = TRUE)
  space <- 0.2
  plot(0, 0, xlim = c(0, 1), ylim = c(0, n_pal),
       type = "n", axes = FALSE, bty = "n", xlab = "", ylab = "")
  for (i in seq_along(pal)) {
    colours <- lepidochroma(names(pal)[i], n = n_col[i])
    rect(xleft = (seq_len(n_col[i]) - 1) / max(n_col), ybottom = i - 1,
         xright = seq_len(n_col[i]) / max(n_col), ytop = i - space,
         col = colours, border = NA)
  }
  yoffset <- (1 - space) / 2
  text(rep(-0.02, length(pal)), (seq_along(pal) - 1) + yoffset,
       labels = names(pal),
       adj = c(1, 0.5), xpd = TRUE)
}

#' Palette preview
#'
#' Displays a preview of a palette or a set of palettes with the
#' specified number of colours in a plot.
#'
#' @param name Palette name (see the `name` column in the data frame
#'   returned by `lepidochroma_palettes()` for a list of available
#'   options).  This argument is case insensitive.  If it is not
#'   specified, all palettes matching the properties indicated in the
#'   `type` and `colourblind_only` arguments will be displayed.
#' @param n Number of colours to display.  It is an optional argument,
#'   if it is not specified, the plot will display all the available
#'   colours.
#' @param type The type of palettes to be displayed (`"all"`,
#'   `"discrete"`, or `"continuous"`).  This argument is ignored if
#'   `name` is specified.  It defaults to `"all"`.
#' @param colourblind_only A logical value.  If `TRUE`, display only
#'   colour blind friendly palettes.  This argument is ignored if
#'   `name` is specified.  It defaults to `FALSE`.
#'
#' @examples
#' # Discrete palette
#' lepidochroma_display("parthenos", 3)
#' # Continuous palette
#' lepidochroma_display("battus", 30)
#'
#' @importFrom graphics image
#' @export
lepidochroma_display <- function(name = NULL, n = NULL,
                                 type = c("all", "discrete", "continuous"),
                                 colourblind_only = FALSE) {
  type <- match.arg(type)

  if (is.null(name)) {
    lepidochroma_display_all(n, type, colourblind_only)
  } else {
    name <- tolower(name) # Case insensitive
    selected_colors <- lepidochroma(name, n)
    if (is.null(n)) {
      n <- length(selected_colors)
    }
    pal_type <- palettes[[name]]$type
    image(
      1:n, 1, as.matrix(1:n),
      col = selected_colors,
      main = paste0(name, ": ", pal_type, " (", n, ")"),
      xlab = " ", ylab = " ", xaxt = "n", yaxt = "n", bty = "n"
    )
  }
}
