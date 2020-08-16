test_that(context("cor.mtest"), {
  x = raw10xtoMatrix('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt', id = "Gene.Symbol")
  x = cor.mtest(x)
  expect_equal(mode(x), "numeric")
  expect_equal(class(x) %>% sort(), c("matrix", "array") %>% sort)
}
)
