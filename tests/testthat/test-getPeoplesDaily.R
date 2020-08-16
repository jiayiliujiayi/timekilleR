test_that("getPeoplesDaily returns science news", {
  x = getPeoplesDaily("headline")
  expect_equal(mode(x), "character")
  expect_equal(class(x), "character")

  x = getPeoplesDaily("latest")
  expect_equal(mode(x), "character")
  expect_equal(class(x), "character")

  x = getPeoplesDaily("tophit")
  expect_equal(mode(x), "character")
  expect_equal(class(x), "character")

})
