test_that(context("getNature"), {
  x = getNature()
  expect_equal(mode(x), "character")
})

test_that(context("getNature"), {
  x = getNature(category = "research")
  expect_equal(mode(x), "character")
})

test_that(context("getNature"), {
  x = getNature(category = "opinion")
  expect_equal(mode(x), "character")
})
