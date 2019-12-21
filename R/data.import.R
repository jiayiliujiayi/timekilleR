#' Fast read data
#' Fast read data frame
#' The functions are developed to fit personal preference. Feel free to modify it.
#'
#' @param path_to_file the path to the dataset
#' @param delim delimiter, default (tab-delimited)
#' @param header default TRUE
#' @param cores number of cores when reading the dataset. default: 29.  Why 29? Because I love the prime numbers.
#'
#' @return
#' @export
#'
#' @keywords data
#'
#' @examples fread.delim('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_df.txt')
#' @importFrom  data.table fread setDTthreads
#' @import magrittr
#' @importFrom parallel detectCores

# fast read a dataset into a data frame
fread.delim <-
  function(path_to_file, delim = "\t", header = T, cores = 29){
    # set path to the file as 'input' variable
    input = path_to_file

    # define n cores to use when reading the dataset
    if(class(detectCores()) == "integer"){
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
    }} else {
      print("Sorry, I could not check the numbers of cores your computer has, set the cores to 1")
      setDTthreads(1)
    }

    # import the data frame
    fread(input,
          stringsAsFactors = F, check.names = F,
          sep = delim, header = header) %>%
      as.data.frame
  }

#' Title
#'fast read a dataset into a matrix
#'
#' @param path_to_file the path to the dataset
#' @param delim delimiter, default (tab-delimited)
#' @param header default TRUE
#' @param cores number of cores when reading the dataset. default: 29.  Why 29? Because I love the prime numbers.
#' @param method defalut = "sum"
#'
#' @return
#' @export
#' @import data.table
#' @import magrittr
#'
#' @examples fread.matrix('https://raw.githubusercontent.com/jiayiliujiayi/timekiller/master/testdata/dataset_matrix.txt')
fread.matrix <-
  function(path_to_file, method = sum, delim = "auto", header = "auto", cores = 29){
    # set path to the file as 'input' variable
    input = path_to_file

    # define n cores to use when reading the dataset
    if(class(detectCores()) == "integer"){
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
      }} else {
        print("Sorry, I could not check the numbers of cores your computer has, set the cores to 1")
        setDTthreads(1)
      }

    # import the data frame
    df.temp <-
      suppressWarnings(
        fread(input,
              stringsAsFactors = F, check.names = F,
              sep = delim, header = header)
        )

    ## extract the id of rownames (the first element of the colnames)
    df.temp.colname1 <- colnames(as.data.frame(df.temp))[1]

    # aggregate and sum
    df.temp <-
      df.temp[, lapply(.SD, method), by = df.temp.colname1]

    ## extract the rownames using the first column the ouput matrix
    df.temp.colname1 <- colnames(df.temp)[1]
    df.temp.rownames <- as.data.frame(df.temp)[, c(df.temp.colname1)]


    # transform into matrix
    df.temp <- df.temp %>% as.data.frame() %>%
      ### remove the 1st column
      .[, !colnames(.) %in% df.temp.colname1] %>%
      ### assign rownames
      `rownames<-`(c(df.temp.rownames)) %>%
      ### convert into matrix
      as.matrix

    df.temp
  }

