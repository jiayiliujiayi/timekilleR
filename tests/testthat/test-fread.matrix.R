test_that("fread.matrix returns a matrix", {
  x = fread.matrix('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_matrix.txt')
  expect_equal(mode(x), "numeric")
  expect_equal(class(x), "matrix")
})
