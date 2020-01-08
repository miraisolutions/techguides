#' Scalar Multiplication
#'
#' Multiply an object by a scalar.
#'
#' @param x The object to be multiplied.
#' @param m Scalar to multiply `x` by.
#'
#' @return The result of the scalar multiplication of `x`.
#'
#' @describeIn times Generic multiplication by `m`.
#'
#' @examples
#' x <- matrix(1:6, 3L)
#'
#' times(x, 1.5)
#'
#' @export
#'
#' @md
times <- function(x, m) {
  x * m
}

#' @describeIn times Multiplication by 2.
#'
#' @examples
#' times2(x)
#'
#' @export
#'
#' @md
times2 <- function(x) {
  times(x, 2)
}

#' @describeIn times Multiplication by 3.
#'
#' @examples
#' times3(x)
#'
#' @export
#'
#' @md
times3 <- function(x) {
  times(x, 3)
}

#' @describeIn times Multiplication by 4.
#'
#' @examples
#' times4(x)
#'
#' @export
#'
#' @md
times4 <- function(x) {
  times(x, 4)
}
