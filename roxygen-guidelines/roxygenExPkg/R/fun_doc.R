#' Function Documentation Example
#'
#' Show an example of roxygen tags organization, providing documentation best
#' practices and guidelines. An explicit `@description` is only needed for
#' multi-paragraph descriptions.
#'
#' @param first_arg Description of the first argument. Also define data type /
#'   class / structure / vectorization expectations where not obvious, and
#'   possibly use (see 'Details').
#' @param second_arg Second argument of the function.
#'
#' @details More details or context about the function and its behaviour. List
#'   possible side-effects, corner-cases and limitations here. Also use this
#'   section for describing the meaning and usage of arguments when this is too
#'   complex or verbose for the `@param` tags.
#'
#' @section Custom section:
#' The content of a custom section.
#'
#' @return Returns `NULL`, invisibly. The function is called for illustration
#'   purposes only.
#'
#' @references
#' Hadley Wickham, Peter Danenberg and Manuel Eugster. roxygen2: In-Line
#' Documentation for R. [https://CRAN.R-project.org/package=roxygen2]().
#'
#' Hadley Wickham, The tidyverse style guide.
#' [https://style.tidyverse.org/documentation.html]().
#'
#' @seealso [fun_doc_tpl()], [roxygen2::roxygenize()]. Even if you just put
#'   comma-separated links to functions, don't forget the final period (.).
#' @family function documentation examples
#'
#' @examples
#' # illustrate through examples how functions can be used
#' fun_doc("example_string", 3)
#'
#' @importFrom roxygen2 roxygenize
#' @importFrom roxygen2 roxygenise
#' @export
#'
#' @md
fun_doc <- function(first_arg, second_arg) {
  invisible()
}
