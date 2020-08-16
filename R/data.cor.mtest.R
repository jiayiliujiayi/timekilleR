#' cor.mtest
#'
#' To compute the matrix of p-value of the correlation test
#' Credit: http://www.sthda.com/english/wiki/visualize-correlation-matrix-using-correlogram
#'
#' @param mat matrix to be tested, col.names will be correlated
#' @param ... further arguments to pass to the native R cor.test function
#'
#' @return
#' @export
#'
#' @examples cor.mtest(mtcars)
cor.mtest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat<- matrix(NA, n, n)
  diag(p.mat) <- 0
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      tmp <- cor.test(mat[, i], mat[, j], ...)
      p.mat[i, j] <- p.mat[j, i] <- tmp$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}
