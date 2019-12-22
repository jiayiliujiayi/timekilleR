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
library('devtools')
devtools::install_github('jiayiliujiayi/timekiller', dependencies = T)
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
**more functions are being developed:))**  

#### Find it difficult to make a decision? Ask the timekiller:  
`tobeornottobe()`:  ask anything to timekiller, then you'll promptly get a Yes/No answer.  The default question is "Should I study today?"  Notice: The pious way of doing this is to ask one question once.  

#### Wanna have some fun?  

`play24points()`: the timekiller will randomly pick 4 pocker cards for you.  You can define the max and min value of the cards to be picked.  

**more functions are being developed:))**  

### The most serious moment when calling timekiller: playing aroung with data! 
- importing data in a fast way  

  `fread.delim()`: fast imports a data frame format text file as a 'data frame' element into the .GLobalEnv.  Yes, it is a wrapper of the data.table::fread but we the oldschool might prefer working on a 'data frame' class element.  

  The format of the input file looks like so:  

  | Gene.Symbol | Gene.ID_1 | Gene.ID_2 | Cell1 | Cell2 |
  | ----------- | --------- | --------- | ----- | ----- |
  | a           | A         | Aa        | 1     | 0     |
  | b           | B         | Bb        | 1     | 1     |
  | c           | C         | Cc        | 1     | 0     |
  | c           | C         | Cc        | 2     | 5     |
  |             | NA        | Dd        | 4     | 6     |

  `fread.matrix()`: fast imports a matrix format text file as a matrix into the .GlobalEnv.  By default, the values with the same rownames in each column will be sumed. And yes, it is still a wrapper of the data.table::fread, with the maggrittr:%>%.  
  The format of the input file looks like so:  

  |      | Cell1 | Cell2 |
  | ---- | ----- | ----- |
  | a    | 1     | 0     |
  | b    | 1     | 1     |
  | c    | 1     | 0     |
  | c    | 2     | 5     |
  |      | 4     | 6     |

- fast inspect data

  `ifCharCols()`: check if there's character type columns in a dataset  

  `getCharCols()`: output the colnames of the charactor type columns  

  `ifNACols()`: check if there's NA-containing columns in a dataset  

  `getNACols()`: output the colnames of the NA-containing columns  


- fast tramsforming data
  `raw10xtoDF()`: fast imports a raw 10X scRNA-Seq dataset, keeps the id column as you request in the argument "id", aggregates the same ids and sum (default, could be changed to "mean" or "median" per your request) the counts for each cell, then transform it into a dataframe.  
  The format of the input file looks like so: 

  | Gene.Symbol | Gene.ID_1 | Gene.ID_2 | Cell1 | Cell2 |
  | ----------- | --------- | --------- | ----- | ----- |
  | a           | A         | Aa        | 1     | 0     |
  | b           | B         | Bb        | 1     | 1     |
  | c           | C         | Cc        | 1     | 0     |
  | c           | C         | Cc        | 2     | 5     |
  |             | NA        | Dd        | 4     | 6     |

  If the id = "Gene.Symbol', then the output 'data.frame' element looks like so: 

  | Gene.Symbol | Cell1 | Cell2 |
  | ----------- | ----- | ----- |
  | a           | 1     | 0     |
  | b           | 1     | 1     |
  | c           | 3     | 5     |
  | novel       | 4     | 6     |





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
