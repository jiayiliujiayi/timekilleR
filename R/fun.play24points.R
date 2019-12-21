#' play24points
#'
#' Randomly pick 4 cards.  You can define the min and max values of the cards to be picked!
#'
#' @param max.value max value in the pocker cards, default 1
#' @param min.value min value in the pocker cards, default 5
#'
#' @return
#' @export
#'
#' @examples play24points()
#'
#' @importFrom stats runif
#' @import magrittr

play24points <-
  function(max.value = 10, min.value = 1){
    # set seed
    set.seed(Sys.time() %>% as.POSIXct(units = "secs") %>% as.numeric %% 1e9)

    # initiate a set of pocker cards
    pocker.cards <-
      data.frame(
        value = rep(1:13, 4),
        poker = rep(c("A", 2:10, "J", "Q", "K"), 4),
        stringsAsFactors = F, check.names = F
      )

    # select values based on the input from the player
    player.cards <- pocker.cards %>% .[.$value %in% c(min.value:max.value), ]

    # output numbers by seed
    player.cards$poker[runif(min = 1, max = (max.value - min.value + 1) * 4, 4) %>% round]
  }
