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
#' @examples fread.delim(path_to_file = data.frame(Gene.Symbol = c("a", "b", "c"),
#' Cell1 = c(1, 1, 2), Cell2 = c(2, 2, 4), stringsAsFactors  = F, check.names = F))
#' @importFrom data.table fread
#' @importFrom parallel detectCores

# fast read a dataset into a data frame
fread.delim <-
  function(path_to_file, delim = "\t", header = T, cores = 29){
    # set path to the file as 'input' variable
    input = path_to_file

    # define n cores to use when reading the dataset
    if(0){if(detectCores() <= cores){
      print(paste0('You have ',
                   detectCores(),
                   ' cores available to use. Setting the number of cores as ',
                   detectCores()/2))
      setDTthreads(detectCores()/2)
    } else{
      print(paste0('Great! You have ',
                   detectCores(),
                   ' cores available to use. Setting the number of cores as ',
                   cores,
                   ' per your request:)'))
      setDTthreads(cores)
    }}

    # import the data frame
    fread(input,
          stringsAsFactors = F, check.names = F,
          sep = delim, header = header) %>%
      as.data.frame
  }

#' Title
#'fast read a dataset into a matrix
#'
#' @param path_to_file: the path to the dataset
#' @param delim: delimiter, default (tab-delimited)
#' @param header: default TRUE
#' @param cores: number of cores when reading the dataset. default: 29.  Why 29? Because I love the prime numbers.
#'
#' @return
#' @export
#'
#' @examples fread.matrix(path_to_file = matrix())
fread.matrix <-
  function(path_to_file, delim = "auto", header = "auto", cores = 29){
    # set path to the file as 'input' variable
    input = path_to_file

    # define n cores to use when reading the dataset
    if(detectCores() <= cores){
      print(paste0('You have ',
                   detectCores(),
                   ' cores available to use. Setting the number of cores as ',
                   detectCores()/2))
      setDTthreads(detectCores()/2)
    } else{
      print(paste0('Great! You have ',
                   detectCores(),
                   ' cores available to use. Setting the number of cores as ',
                   cores,
                   ' per your request:)'))
      setDTthreads(cores)
    }

    # import the data frame
    df.temp <-
      fread(input,
            stringsAsFactors = F, check.names = F,
            sep = delim, header = header) %>%
      as.data.frame
    ## extract the rownames using the first column the ouput matrix
    df.temp.colname1 <- colnames(df.temp)[1]
    df.temp.rownames <- df.temp[, c(df.temp.colname1)]


    # transform into matrix
    df.temp <- df.temp %>%
      ### remove the 1st column
      .[, !colnames(.) %in% df.temp.colname1] %>%
      ### assign rownames
      `rownames<-`(c(df.temp.rownames)) %>%
      ### convert into matrix
      as.matrix

    df.temp
  }
