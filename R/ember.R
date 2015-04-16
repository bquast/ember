#' ember
#' @import htmlwidgets
#' @export
ember <- function(json, width = NULL, height = NULL) {

  # read the data file
  data <- paste(readLines(json), collapse = "\n" )

  # forward options using settings
  settings = list(
    width = width,
    height = height
  )

  # pass the data and settings using 'x'
  x <- list(
    data = data,
    settings = settings
  )

  # create widget
  htmlwidgets::createWidget(
    name    = 'ember',
    x       = x,
    width   = width,
    height  = height,
    package = 'ember'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
emberOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'ember', width, height, package = 'ember')
}

#' Widget render function for use in Shiny
#'
#' @export
renderEmber <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, emberOutput, env, quoted = TRUE)
}
