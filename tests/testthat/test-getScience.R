test_that("getScience returns science news", {
  x = getScience()
  expect_equal(mode(x), "character")
  expect_equal(class(x), "character")

  x = getScience("insider")
  expect_equal(mode(x), "character")
  expect_equal(class(x), "character")
})
