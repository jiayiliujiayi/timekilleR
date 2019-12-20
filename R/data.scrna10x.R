#' Title
#'
#' @param path_to_file the path to the dataset
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
#' @examples raw10xtoDF
#'
#' @importFrom data.table as.data.table

raw10xtoDF <-
  function(path_to_file, id = "Gene Symbol", cores = 19, delim = "auto", header = T){
    input = path_to_file
    id = id

    # read raw 10x counts dataset
    df.temp <- fread.delim(input, delim = delim, header = header, cores = cores)

    # trim "Gene ID_1","Gene ID_2" columns
    df.temp <-
      df.temp %>% .[, !colnames(.) %in% c("Gene ID_1","Gene ID_2")] %>%
      # convert to data.table and aggregate by "Gene Symbol" and sum for each column aka cell
      as.data.table %>% .[, lapply(.SD, sum), by = id] %>%
      # convert into data frame
      as.data.frame

    # replace the blank Gene Symbol with "novel"
    df.temp[which(df.temp[, id] == ""), id] = "novel"

    # output df
    df.temp
  }
