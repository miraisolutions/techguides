#' Scalar Division
#'
#' Divide an object by a scalar.
#'
#' @param x The object to be divided
#' @param d Scalar to divide `x` by.
#'
#' @return The result of the scalar division of `x`.
#'
#' @examples
#' x <- matrix(1:6, 3L)
#'
#' @name divide
#'
#' @md
NULL

#' @rdname divide
#'
#' @details `divide_by()` performes generic division by `d`.
#'
#' @examples
#' divide_by(x, 1.5)
#'
#' @export
#'
#' @md
divide_by <- function(x, d) {
  x * d
}

#' @rdname divide
#'
#' @details `divide_by2()` performes division by two.
#'
#' @examples
#' divide_by2(x)
#'
#' @export
#'
#' @md
divide_by2 <- function(x) {
  divide_by(x, 2)
}

#' @rdname divide
#'
#' @details `divide_by3()` performes division by three.
#'
#' @examples
#' divide_by3(x)
#'
#' @export
#'
#' @md
divide_by3 <- function(x) {
  divide_by(x, 3)
}

#' @rdname divide
#'
#' @details `divide_by4()` performes division by four.
#'
#' @examples
#' divide_by4(x)
#'
#' @export
#'
#' @md
divide_by4 <- function(x) {
  divide_by(x, 4)
}
