#' tobeornottobe
#'
#' "To be, or not to be: that is the question. \cr
#' Whether it’s nobler in the mind to suffer \cr
#' The slings and arrows of outrageous fortune, \cr
#' Or to take arms against a sea of troubles, \cr
#' And by opposing end them?" \cr
#' \cr
#' --Hamlet 3.1
#'
#' @keywords fun
#'
#' @param input ask a yes or no question or say some random words to the timekiller,
#' e.g.: simply "Should I have lunch today?" or just "asdklfja2".
#'
#' @return
#' @export
#' @importFrom stats runif
#'
#' @examples tobeornottobe("Should I have lunch today?")
tobeornottobe <-
  function(input = "Should I study today?"){
    if(class(input) == "character"){
      # convert the input character into a numeric (nchar here)
      input.nchar <- nchar(input)
      # set seed, plus a time variable
      ## modulo 1e9 incase the second variable exceeds the max integer of R, which is 2147483647 (.Machine$integer.max)
      set.seed(input.nchar + Sys.time() %>% as.POSIXct(units="secs") %>% as.numeric() %% 1e9)
      # fake numeric vector simulator, then modulo the sum of which
      input.to.number <-
        round(runif(min = 1, max = 99999, n = input.nchar)) %>% sum
      if(input.to.number %% 2 == 0){
        print("Yes")
      }else{
        print("No")
      }
    } else {
      cat("Please ask me a question or tell me some random things\ne.g., \"Should I have dinner today?\" or just \"asdafj\"")
    }
  }

