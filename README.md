# timekiller
[![Build Status](https://travis-ci.org/jiayiliujiayi/timekiller.svg?branch=master)](https://travis-ci.org/jiayiliujiayi/timekiller)

[Jiayi Liu :pig:](https://jiayiliu.me)

---
The timekiller is an [R](https://www.r-project.org) package with several unimportant, superstitious and personal R functions that help with killing time. 

Also, writing this package itself is one of the ways to kill time.  

This package is a form of "reinventing the wheel".  

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
#### Check what's happening from all corners of the world:  
`getPeoplesDaily()`:  scrape the latest news from the People’s Daily, China’s largest comprehensive media.  
`getNature()`: wanna keep updated in the scientific world? Try this funcion to acquire the latest news from the Nature, a leading international weekly journal of science!  
more functions are being developed:))  
#### Find it difficult to make a decision? Ask the timekiller:  
`tobeornottobe()`:  ask anything to timekiller, then you'll promptly get a Yes/No answer.  The default question is "Should I study today?"  Notice: The pious way of doing this is to ask one question once.  

#### The most serious moment when calling timekiller: playing aroung with data! 
-   importing data in a fast way  
`fread.delim()`: fast imports a data frame format text file as a 'data frame' element into the .GLobalEnv.  Yes, it is a wrapper of the data.table::fread but we the oldschool might prefer working on a 'data frame' class element.  
The format of the input file looks like so:  

| Gene.Symbol | Cell1 | Cell2 |
|-------------|-------|-------|
|a|1|2|
|b|1|2|
|c|2|4|

`fread.matrix()`: fast imports a matrix format text file as a matrix into the .GlobalEnv.  And yes, it is still a wrapper of the data.table::fread, with the maggrittr:%>%.  
The format of the input file looks like so:  

|             | Cell1 | Cell2 |
|-------------|-------|-------|
|**a**|1|2|
|**b**|1|2|
|**c**|2|4|

-   fast inspect data

`ifCharCols()`: check if there's character columns in a dataset

`getCharCols()`: output a list of colnames of the charactor columns  

-   fast tramsforming data
`raw10xtoDF()`: fast imports a raw 10X scRNA-Seq dataset, keeps the GeneSymbol column, aggregates the same symbols and sum the counts for each cell, then transform it into a dataframe.  
The format of the input file looks like so: 

| Gene.Symbol | Gene_ID.1 | Gene_ID.2 | Cell1 | Cell2 |
|-------------|-------|-------|---|---|
|a|A|Aa|1|2|
|b|B|Bb|1|2|
|c|C|Cc|1|2|
|c|C|Cc|1|2|

The format of the output 'data.frame' element looks like so: 

| Gene.Symbol | Cell1 | Cell2 |
|-------------|-------|-------|
|a|1|2|
|b|1|2|
|c|2|4|





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
