# timekiller
[![Build Status](https://travis-ci.org/jiayiliujiayi/timekiller.svg?branch=master)](https://travis-ci.org/jiayiliujiayi/timekiller)
  
[Jiayi Liu :pig:](https://jiayiliu.me)
  
---
The timekiller is an [R](https://www.r-project.org) package with several unimportant, superstitious and personal R functions that kill time. 

Also, writing this package itself is one of the ways to kill time.  

---

Installation and loading:  
------------------------
-   Install the latest developmental version from within R:  
```r
install.packages('devtools')
devtools::install_github('jiayiliujiayi/timekiller')
```  
-   or install with the source code: in your terminal, execute the following lines:    
```bash
git clone https://github.com/jiayiliujiayi/timekiller.git 
cd .. && R CMD INSTALL timekiller
```
-   Loading the package:  
```r
library(timekiller)
```
Usage  
------------------------
Time to kill time!  
#### Check what's happening in the other corners of the world:  
`getPeoplesDaily()`:  scrape the latest news from the People’s Daily, China’s largest comprehensive media.  
`getNature()`: wanna keep updated in the scientific world? Try this funcion to acquire the latest news from the Nature, a leading international weekly journal of science!  
#### Cannot make a decision? Ask the timekiller:  
`tobeornottobe()`:  ask anything to timekiller, then you'll promptly get a Yes/No answer.  Notice: The pious way of doing this is to ask one question once.  
#### The serious moment when calling timekiller: __data manipulation__  
##### importing data in a faster way  
`fread.delim()`: takes a data frame as input and import it as a data frame into the .GLobalEnv.  Yes, it is a wrapper of data.table::fread but we the oldschool might prefer working on a 'data frame' class element.  
`fread.matrix()`:
  
  
  
### to be developed  
#### some unimportant and superstitious functions
~~getNature: scrape latest research/news/opinions from nature.com~~  
getScience/Cell? wrap these three or more into getSci?  
whoAmItoday: randomly generate a noun  
getWeather: arguments including "today"(default), "yesterday", "tomorrow" and "week" (which represents this week)  
getAirQualityIndex/getAQI  
play24points: generate four integers within the range of [1,10].  
myLuckyNumber: generate today's lucky number, seed(Sys.Date %% 1e10)  
getPoem(): eng and chn
#### data manipulation functions in the preprocessing of the genomic data  
readCountsMatrix: fast read counts matrix (avoid using read.table)  
aggregateGeneSymbols: sum counts with the same gene.symbols for each cell (call data.table .SD)  
CountsToMatrix: call magrittr pipe; amend colnames(.)[1] before tranformation  
MatrixToCounts: call pipe
