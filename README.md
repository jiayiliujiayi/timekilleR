# timekiller
[![Build Status](https://travis-ci.org/jiayiliujiayi/timekiller.svg?branch=master)](https://travis-ci.org/jiayiliujiayi/timekiller)
  
[Jiayi Liu](https://jiayiliu.me)
  
---
The timekiller is an [R](https://www.r-project.org) package with unimportant, superstitious and personal R functions that kill time.  

---
### to be developed  
#### some unimportant and superstitious functions
getNature: scrape latest research/news/opinions from nature.com  
getScience/Cell? wrap these three or more into getResearch?  
whoAmItoday: randomly generate a noun  
getWeather: arguments including "today"(default), "yesterday", "tomorrow" and "wees" (which represents this week)  
play24points: generate four integers within the range of [1,10].  
myLuckyNumber: generate today's lucky number, seed(Sys.Date)
#### data manipulation functions in the preprocessing of the genomic data  
readCountsMatrix: fast read counts matrix (avoid using read.table)  
CountsToMatrix: call magrittr pipe
MatrixToCounts: call pipe
