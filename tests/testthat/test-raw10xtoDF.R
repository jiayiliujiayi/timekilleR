test_that(context("Correct distribution of random numbers"), {
  x = raw10xtoDF("https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt", id = "Gene.Symbol")
  expect_equal(mode(x), "list")
}
)
