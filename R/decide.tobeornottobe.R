tobeornottobe <-
  function(input = NULL){
    if(class(input) == "character"){
      # convert the input character into a numeric (nchar here)
      input.nchar <- nchar(input)
      # set seed, I love the prime number 23
      set.seed(input.nchar + 23)
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
