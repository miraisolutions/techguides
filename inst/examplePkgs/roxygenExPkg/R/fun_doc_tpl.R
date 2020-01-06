#' Template Documentation Example
#'
#' Show an example of roxygen tags organization, providing documentation best
#' practices and guidelines, using templates.
#'
#' @template param-first_arg
#' @param second_arg Description of the second argument.
#'
#' @template details-fun_doc
#'
#' @section Custom section:
#' The content of a custom section.
#'
#' @template return-NULL
#'
#' @template reference-roxygen2
#' @template reference-tidyverse_style_guide
#'
#' @seealso [fun_doc_tpl()], [roxygen2::roxygenize()]. Even if you just put
#'   comma-separated links to functions, don't forget the final period (.).
#' @family function documentation examples
#'
#' @example man-roxygen/ex-fun_doc_tpl.R
#'
#' @importFrom roxygen2 roxygenize
#' @importFrom roxygen2 roxygenise
#' @export
#'
#' @md
fun_doc_tpl <- function(first_arg, second_arg) {
  invisible()
}
