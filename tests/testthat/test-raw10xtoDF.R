test_that(context("raw10xtoDF"), {
  x = raw10xtoDF("https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt", id = "Gene.Symbol")
  expect_equal(mode(x), "list")
}
)
