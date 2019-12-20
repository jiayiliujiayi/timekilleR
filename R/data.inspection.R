#' ifCharCols
#'
#' Check if there are character columns in your dataset.
#'
#' @param path_to_file
#'
#' @return
#' @export
#' @keywords data
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

#' getCharCols
#'
#' Extract the colnames of the "character" columns
#'
#' @param path_to_file
#'
#' @return
#' @export
#'
#' @examples getCharCols('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt')
getCharCols <-
  function(path_to_file){
    input = path_to_file

    #----------- define temp.ifCharCols to get a boolean output -----------------#
    temp.ifCharCols <-
      function(path_to_file){
        # read file as data frame
        df.temp <- suppressWarnings(fread(path_to_file) %>% as.data.frame)

        # column types
        col.types <- sapply(df.temp, typeof) %>% `names<-`(NULL)

        # output boolean
        length(which(col.types == "character")) >= 1
      }
    #----------- define temp.ifCharCols to get a boolean output -----------------#

    # read.file as data frame
    df.temp <- suppressWarnings(fread(path_to_file) %>% as.data.frame)

    # column types
    col.types <- sapply(df.temp, typeof) %>% `names<-`(NULL)

    # get colnames of character columns
    if(temp.ifCharCols(input) == FALSE){
      print("There's no character columns in this dataset")
    } else {
      print(
        colnames(df.temp)[which(col.types == "character")]
      )
    }
  }


