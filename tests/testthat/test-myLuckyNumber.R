test_that("test myLuckyNumber", {
  x = myLuckyNumber()
  expect_equal(mode(x), "numeric")
})
