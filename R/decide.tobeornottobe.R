tobeornottobe <-
  function(input = NULL){
    if(class(input) == "character"){
      # convert the input character into a numeric (nchar here)
      input.nchar <- nchar(input)
      # set seed, plus a time variable
      set.seed(input.nchar + Sys.time() %>% as.POSIXct(units="secs") %>% as.numeric())
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
