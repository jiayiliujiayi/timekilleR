test_that(context("raw10xtoMatrix"), {
  x = raw10xtoMatrix('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt', id = "Gene.Symbol")
  expect_equal(mode(x), "numeric")
  expect_equal(class(x) %>% sort(), c("matrix", "array") %>% sort)
}
)
