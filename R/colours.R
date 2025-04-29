make_palette <- function(colours, type = "discrete", colourblind = FALSE) {
  list(
    palette = colours,
    type = type,
    colourblind_friendly = colourblind
  )
}

palettes <- list(
  danaus = make_palette(
    c("#0d0b0e", "#873412", "#ff672c", "#fec16e", "#f9e8da"),
    "continuous", colourblind = TRUE
  ),
  morpho = make_palette(
    c("#1e0904", "#004166", "#0b7096", "#1bbce6", "#5ddce7", "#b1e7e9"),
    "continuous", colourblind = TRUE
  ),
  battus = make_palette(
    c("#14130f", "#005682", "#2a7eaa", "#6eb6c8", "#eae6b9", "#f78513"),
    "continuous", colourblind = TRUE
  ),
  diaethria = make_palette(
    c("#01090b", "#c60006", "#c8b08c", "#4dafca", "#e9f066", "#87cf5f"),
    "discrete", colourblind = TRUE
  ),
  ornithoptera = make_palette(
    c("#281a17", "#b80405", "#a5d004", "#61cdda", "#f7ba09", "#fa620f"),
    "discrete", colourblind = FALSE
  ),
  attacus = make_palette(
    c("#a02d12", "#f9c04d", "#d899ac", "#c9bb95", "#bfcdf0", "#533722"),
    "discrete", colourblind = TRUE
  ),
  polyommatus = make_palette(
    c("#285d7c", "#a2acdd", "#c5ae82", "#7e542a", "#ea6e0a"),
    "discrete", colourblind = FALSE
  ),
  inachis = make_palette(
    c("#ce3605", "#fff0b5", "#ba9fc2", "#4f71e0", "#fb9b15", "#0d0d0d"),
    "discrete", colourblind = TRUE
  ),
  charaxes = make_palette(
    c("#243926", "#d8a41c", "#3294ef", "#e5650a", "#892607", "#7498a4"),
    "discrete", colourblind = FALSE
  ),
  parthenos = make_palette(
    c("#5f3b79", "#69bedb", "#b56d81", "#f9b66f", "#72d6ba", "#dadb8b"),
    "discrete", colourblind = FALSE
  ),
  eryphanis = make_palette(
    c("#242865", "#3173ff", "#e182f8", "#55212e", "#cd9d77"),
    "discrete", colourblind = TRUE
  ),
  teinopalpus = make_palette(
    c("#253218","#3f7300", "#2cc23d", "#ffffa8", "#f48e1f", "#8d3b16"),
    "continuous", colourblind = FALSE
  )
)
