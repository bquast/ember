#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
ember <- function(message, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    message = message
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'ember',
    x,
    width = width,
    height = height,
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
