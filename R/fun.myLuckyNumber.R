#' myLuckyNumber
#'
#' Ask the timekiller what's your lucknumber for today.  Remeber not to ask it two times in the same day.
#'
#' @param min lower limit of the number, default 1
#' @param max upper limit of the number, defalut 2
#'
#' @return
#' @export
#'
#' @importFrom stats runif
#' @import magrittr
#'
#' @examples myLuckyNumber(min = 5, max = 10)
myLuckyNumber <-
  function(min = 1, max = 100){
    set.seed(Sys.time() %>% as.POSIXct(units="secs") %>% as.numeric() %% 1e9)
    runif(min = min, max = max, n = 1) %>% round
  }
