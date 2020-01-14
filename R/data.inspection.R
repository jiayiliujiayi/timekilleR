#' ifCharCols
#'
#' Check if there are character columns in your dataset.
#'
#' @param path_to_file the path to the dataset, or the name of the element in the working environment
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
    if(mode(input) == 'character'){
      df.temp <- suppressWarnings(fread(input) %>% as.data.frame)
    } else {
      df.temp = input
    }

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
#' @param path_to_file the path to the dataset, or the name of the element in the working environment
#'
#' @return
#' @export
#' @import magrittr
#' @importFrom data.table fread
#'
#' @examples getCharCols('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt')
getCharCols <-
  function(path_to_file){input = path_to_file

    #----------- define temp.ifCharCols to get a boolean output -----------------#
    temp.ifCharCols <-
      function(path_to_file){
        # read file as data frame
        if(mode(input) == 'character'){
          df.temp <- suppressWarnings(fread(input) %>% as.data.frame)
        } else {
          df.temp = input
        }

        # column types
        col.types <- sapply(df.temp, typeof) %>% `names<-`(NULL)

        # output boolean
        length(which(col.types == "character")) >= 1
      }
    #----------- define temp.ifCharCols to get a boolean output -----------------#

    # read.file as data frame
    if(mode(input) == 'character'){
      df.temp <- suppressWarnings(fread(input) %>% as.data.frame)
    } else {
      df.temp = input
    }

    # column types
    col.types <- sapply(df.temp, typeof) %>% `names<-`(NULL)

    # get colnames of character columns
    if(temp.ifCharCols(input) == FALSE){
      print("There's no character columns in this dataset")
    } else {
        colnames(df.temp)[which(col.types == "character")]
    }
  }


#' ifNACols
#'
#'Check if there are NA-containing columns in your dataset.
#'
#' @param path_to_file the path to the dataset, or the name of the element in the working environment
#'
#' @return
#' @export
#'
#' @import magrittr
#' @importFrom data.table fread
#'
#'
#' @examples ifNACols('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt')
ifNACols <-
  function(path_to_file){
    input = path_to_file

    # read file as a data frame
    if(mode(input) == 'character'){
      df.temp <- suppressWarnings(fread(input) %>% as.data.frame)
    } else {
      df.temp = input
    }

    # column types
    Na.cols.sum <- sapply(df.temp, is.na) %>% colSums() %>% sum

    # check if there are "character"s in the column types
    if(Na.cols.sum != 0){
      print("Yes, there are some NA columns in this dataset.")
      print("Furthermore, you can call getNACols() to get the colnames of NA columns")
    } else {
      print("No, there is no NA columns in this dataset")
    }
  }


#' getNACols
#' Extract the colnames of the NA-containing columns in your dataset.
#'
#' @param path_to_file the path to the dataset, or the name of the element in the working environment
#'
#' @return
#' @export
#' @importFrom data.table fread
#' @import magrittr
#'
#' @examples getNACols('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt')
getNACols <-
  function(path_to_file){
    input = path_to_file

    # read file as a data frame
    if(mode(input) == 'character'){
      df.temp <- suppressWarnings(fread(input) %>% as.data.frame)
    } else {
      df.temp = input
    }

    # column types
    Na.cols.sum <- sapply(df.temp, is.na) %>% colSums()

    # which columns contains NA
    Na.ncol <- which(Na.cols.sum != 0)

    # check if there are "character"s in the column types
    if(sum(Na.cols.sum) != 0){
      colnames(df.temp)[Na.ncol]
    } else {
      print("No, there is no NA columns in this dataset")
    }
  }
