#' ifCharCols
#' Check if there are character columns in your dataset.
#'
#' @param path_to_file
#'
#' @return
#' @export
#'
#' @examples ifCharCols('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt')
#' @importFrom data.table fread
ifCharCols <-
  function(path_to_file){
    input = path_to_file

    # read file as a data frame
    df.temp <- suppressWarnings(fread(input) %>% as.data.frame)

    # column types
    col.types <- sapply(df.temp, typeof) %>% `names<-`(NULL)

    # check if there are "character"s in the column types
    if(length(which(col.types == "character")) >= 1){
      print("Yes, there are some character columns in this dataset.")
      print("Furthermore, you can call getCharCols() to get the colnames of character columns")
    } else {
      print("No, there is no character columns in this dataset")
    }
  }
