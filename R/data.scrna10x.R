#' Title
#'
#' @param path_to_file the path to the dataset
#' @param method manipulate the values of one cell with the same gene symbols/ids. defalut = "sum"
#' @param id the grouping id in the dataset, default = "Gene Symbol".
#' @param cores number of cores when reading the dataset. default: 19.
#' @param delim delimiter, default (tab-delimited)
#' @param header default = T
#'
#' @keywords data
#'
#' @return
#' @export
#'
#' @examples raw10xtoDF('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt', id = "Gene.Symbol")
#'
#' @importFrom data.table fread as.data.table
#' @import magrittr

raw10xtoDF <-
  function(path_to_file, method = sum, id = "Gene Symbol", cores = 19, delim = "auto", header = T){
    input = path_to_file
    id = id

    # read raw 10x counts dataset
    if (mode(input) == 'character') {
      df.temp <-
        fread.delim(input, delim = delim, header = header, cores = cores)
    } else {
      df.temp = input
    }

    # get the non numeric colnames of the dataframe "df.temp"
    non.num.colnames <-
      c(getNACols(df.temp),
        getCharCols(df.temp)) %>%
      unique()

    # keep the input id column and the numeric part (transcripts counts) and aggregate
    df.temp <-
      # cbind the id column and the numeric parts of the df.temp
      data.frame(id = df.temp[, id],
                 df.temp %>% .[, !colnames(.) %in% non.num.colnames],
                 stringsAsFactors = F, check.names = F) %>%
      # temporarily convert the element into a 'data.table'
      as.data.table %>%
      #aggregate by "id" and sum for each column aka cell
      .[, lapply(.SD, method), by = "id"] %>%
      # convert back into a "data frame"
      as.data.frame

    # convert "id" column name as the real input id
    colnames(df.temp)[1] <- id

    # replacing the unwanted symbols/ids
    # replace the blank Gene Symbols with "novel"
    df.temp[which(df.temp[, id] == ""), id] = "novel"
    # replace the NA Gene IDs with 'novel'
    df.temp[which(is.na(df.temp[, id]) == T), id] = "novel"

    # output df
    return(df.temp)
  }


#' raw10xtoMatrix
#'
#' @param path_to_file the path to the dataset
#' @param method manipulate the values of one cell with the same gene symbols/ids. defalut = "sum"
#' @param id the grouping id in the dataset, default = "Gene Symbol".
#' @param cores number of cores when reading the dataset. default: 19.
#' @param delim delimiter, default (tab-delimited)
#' @param header default = T
#'
#' @return
#' @export
#'
#' @importFrom data.table fread as.data.table
#' @import magrittr

#'
#' @examples raw10xtoMatrix('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt', id = "Gene.Symbol")
raw10xtoMatrix <-
  function(path_to_file, method = sum, id = "Gene Symbol", cores = 19, delim = "auto", header = T){
    input = path_to_file
    id = id

    # read raw 10x counts dataset
    if (mode(input) == 'character') {
      df.temp <-
        fread.delim(input, delim = delim, header = header, cores = cores)
    } else {
      df.temp = input
    }

    # get the non numeric colnames of the dataframe "df.temp"
    non.num.colnames <-
      c(getNACols(df.temp),
        getCharCols(df.temp)) %>%
      unique()

    # keep the input id column and the numeric part (transcripts counts) and aggregate
    df.temp <-
      # cbind the id column and the numeric parts of the df.temp
      data.frame(id = df.temp[, id],
                 df.temp %>% .[, !colnames(.) %in% non.num.colnames],
                 stringsAsFactors = F, check.names = F) %>%
      # temporarily convert the element into a 'data.table'
      as.data.table %>%
      #aggregate by "id" and sum for each column aka cell
      .[, lapply(.SD, method), by = "id"] %>%
      # convert back into a "data frame"
      as.data.frame

    # convert "id" column name as the real input id
    colnames(df.temp)[1] <- id

    # replacing the unwanted symbols/ids
    # replace the blank Gene Symbols with "novel"
    df.temp[which(df.temp[, id] == ""), id] = "novel"
    # replace the NA Gene IDs with 'novel'
    df.temp[which(is.na(df.temp[, id]) == T), id] = "novel"

    # convert df into matrix
    ## assign rownames
    df.temp %>% `rownames<-`(c(.[, 1])) %>%
      ## remove the id column
      .[, -1] %>%
      ## convert into matrix
      as.matrix
  }
