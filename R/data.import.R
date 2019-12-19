#' Fast read data
#' Fast read data frame
#' The functions are developed to fit personal preference. Feel free to modify it.
#'
#' @param path_to_file: the path to the dataset
#' @param delim: delimiter, default (tab-delimited)
#' @param header: default TRUE
#' @param cores: number of cores when reading the dataset. default: 29.  Why 29? Because I love the prime numbers.
#'
#' @return
#' @export
#'
#' @examples fread.delim('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt')
#' @importFrom data.table fread
#' @importFrom parallel detectCores

# fast read a dataset into a data frame
fread.delim <-
  function(path_to_file, delim = "\t", header = T, cores = 29){
    # set path to the file as 'input' variable
    input = path_to_file

    # define n cores to use when reading the dataset
    # if(detectCores() <= cores){
    #   print(paste0('You have ',
    #                detectCores(),
    #                ' cores available to use. Setting the number of cores as ',
    #                detectCores()/2))
    #   setDTthreads(detectCores()/2)
    # } else{
    #   print(paste0('Great! You have ',
    #                detectCores(),
    #                ' cores available to use. Setting the number of cores as ',
    #                cores,
    #                ' per your request:)'))
    #   setDTthreads(cores)
    # }

    # import the data frame
    fread(input,
          stringsAsFactors = F, check.names = F,
          sep = delim, header = header) %>%
      as.data.frame
  }
