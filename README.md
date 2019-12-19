# timekiller
[![Build Status](https://travis-ci.org/jiayiliujiayi/timekiller.svg?branch=master)](https://travis-ci.org/jiayiliujiayi/timekiller)
  
[Jiayi Liu](https://jiayiliu.me)
  
---
The timekiller is an [R](https://www.r-project.org) package with several unimportant, superstitious and personal R functions that kill time. 

Also, writing this package itself is a way to kill time.  

---

## Installation and loading:
------------------------
-     Install with devtools from within R:  
```r
install.packages('devtools')
devtools::install_github('jiayiliujiayi/timekiller')
```  
-     or install with the source code: in your terminal, execute the following lines:    
```
git clone https://github.com/jiayiliujiayi/timekiller.git 
cd .. && R CMD INSTALL timekiller
```
-     Loading the package:  
```r
library(timekiller)
```

### to be developed  
#### some unimportant and superstitious functions
~~getNature: scrape latest research/news/opinions from nature.com~~  
getScience/Cell? wrap these three or more into getResearch?  
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
