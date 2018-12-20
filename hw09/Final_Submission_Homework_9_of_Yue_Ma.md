---
title: "Final Submission Homework 9 of Yue Ma"
author: "Yue Ma"
date: "11/21/2018"
always_allow_html: yes
output: 
   html_document:
     keep_md: true
---



# Web Scraping with Selectors

## 1. Get HTML

```r
library(xml2)
library(httr)
library(rvest)
url_wiki <- "https://en.wikipedia.org/wiki/Mitch_McConnell"
wiki <- read_html(url_wiki)
wiki
```

```
## {xml_document}
## <html class="client-nojs" lang="en" dir="ltr">
## [1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset= ...
## [2] <body class="mediawiki ltr sitedir-ltr mw-hide-empty-elt ns-0 ns-sub ...
```

```r
mm_table <- html_node(x = wiki, xpath = '//*[@id="mw-content-text"]/div/table[2]')
mm_table
```

```
## {xml_node}
## <table class="infobox vcard" style="width:22em">
## [1] <tbody>\n<tr><th colspan="2" style="text-align:center;font-size:125% ...
```

## 2. Get the info box
a) Find the CSS class of the infobox.
THe CSS class of the infobox is "infobox.vcard".

b) Extract the part of the HTML document that contains the infobox using the CSS information.

```r
infobox <- wiki %>%
  html_node(".infobox.vcard") %>%
  html_table() 
infobox
```

```
##                                                                          Mitch McConnell
## 1                                                                                       
## 2                                                                                       
## 3                                                                 Senate Majority Leader
## 4                                                                              Incumbent
## 5                                                         Assumed office January 3, 2015
## 6                                                                                 Deputy
## 7                                                                            Preceded by
## 8                                                                 Senate Minority Leader
## 9                                             In officeJanuary 3, 2007 – January 3, 2015
## 10                                                                                Deputy
## 11                                                                           Preceded by
## 12                                                                          Succeeded by
## 13                                                                  Senate Majority Whip
## 14                                            In officeJanuary 3, 2003 – January 3, 2007
## 15                                                                                Leader
## 16                                                                           Preceded by
## 17                                                                          Succeeded by
## 18                                                    United States Senatorfrom Kentucky
## 19                                                                             Incumbent
## 20                                  Assumed office January 3, 1985Serving with Rand Paul
## 21                                                                           Preceded by
## 22                                                   Chair of the Senate Rules Committee
## 23                                              In officeJanuary 20, 2001 – June 6, 2001
## 24                                                                           Preceded by
## 25                                                                          Succeeded by
## 26                                            In officeJanuary 3, 1999 – January 3, 2001
## 27                                                                           Preceded by
## 28                                                                          Succeeded by
## 29                                                   Judge/Executive of Jefferson County
## 30                                                                    In office1977–1984
## 31                                                                           Preceded by
## 32                                                                          Succeeded by
## 33 Acting United States Assistant Attorney General for the Office of Legislative Affairs
## 34                                                                         In office1975
## 35                                                                             President
## 36                                                                           Preceded by
## 37                                                                          Succeeded by
## 38                                                                                      
## 39                                                                      Personal details
## 40                                                                                  Born
## 41                                                                       Political party
## 42                                                                             Spouse(s)
## 43                                                                              Children
## 44                                                                             Education
## 45                                                                             Net worth
## 46                                                                             Signature
## 47                                                                               Website
## 48                                                                      Military service
## 49                                                                            Allegiance
## 50                                                                        Service/branch
## 51                                                                      Years of service
## 52                                                                                  Unit
##                                                                                   Mitch McConnell
## 1                                                                                                
## 2                                                                                                
## 3                                                                          Senate Majority Leader
## 4                                                                                       Incumbent
## 5                                                                  Assumed office January 3, 2015
## 6                                                               John CornynJohn Thune (Designate)
## 7                                                                                      Harry Reid
## 8                                                                          Senate Minority Leader
## 9                                                      In officeJanuary 3, 2007 – January 3, 2015
## 10                                                                   Trent LottJon KylJohn Cornyn
## 11                                                                                     Harry Reid
## 12                                                                                     Harry Reid
## 13                                                                           Senate Majority Whip
## 14                                                     In officeJanuary 3, 2003 – January 3, 2007
## 15                                                                                     Bill Frist
## 16                                                                                     Harry Reid
## 17                                                                                    Dick Durbin
## 18                                                             United States Senatorfrom Kentucky
## 19                                                                                      Incumbent
## 20                                           Assumed office January 3, 1985Serving with Rand Paul
## 21                                                                          Walter Dee Huddleston
## 22                                                            Chair of the Senate Rules Committee
## 23                                                       In officeJanuary 20, 2001 – June 6, 2001
## 24                                                                                     Chris Dodd
## 25                                                                                     Chris Dodd
## 26                                                     In officeJanuary 3, 1999 – January 3, 2001
## 27                                                                                    John Warner
## 28                                                                                     Chris Dodd
## 29                                                            Judge/Executive of Jefferson County
## 30                                                                             In office1977–1984
## 31                                                                            Todd Hollenbach III
## 32                                                                                  Bremer Ehrler
## 33          Acting United States Assistant Attorney General for the Office of Legislative Affairs
## 34                                                                                  In office1975
## 35                                                                                    Gerald Ford
## 36                                                                              Vincent Rakestraw
## 37                                                                                Michael Uhlmann
## 38                                                                                               
## 39                                                                               Personal details
## 40 Addison Mitchell McConnell Jr. (1942-02-20) February 20, 1942 (age 76)Sheffield, Alabama, U.S.
## 41                                                                                     Republican
## 42                                       Sherrill Redmon(m. 1968; div. 1980)Elaine Chao (m. 1993)
## 43                                                                                              3
## 44                                       University of Louisville (BA)University of Kentucky (JD)
## 45                                                                    $22.5 million (estimate)[1]
## 46                                                                                               
## 47                                                                                 Senate website
## 48                                                                               Military service
## 49                                                                                  United States
## 50                                                                             United States Army
## 51                                                                                           1967
## 52                                                                     United States Army Reserve
```

## 3. Make a data frame
a) Parse the infobox table HTML you obtained above into a data frame.

```r
infobox_dataframe <- as.data.frame(infobox)
head(infobox_dataframe)
```

```
##                  Mitch McConnell                   Mitch McConnell
## 1                                                                 
## 2                                                                 
## 3         Senate Majority Leader            Senate Majority Leader
## 4                      Incumbent                         Incumbent
## 5 Assumed office January 3, 2015    Assumed office January 3, 2015
## 6                         Deputy John CornynJohn Thune (Designate)
```

b) Name the columns of the table you obtain key and value. 

```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
colnames(infobox_dataframe) <- c("key", "value")
head(infobox_dataframe)
```

```
##                              key                             value
## 1                                                                 
## 2                                                                 
## 3         Senate Majority Leader            Senate Majority Leader
## 4                      Incumbent                         Incumbent
## 5 Assumed office January 3, 2015    Assumed office January 3, 2015
## 6                         Deputy John CornynJohn Thune (Designate)
```

c) Filter the data frame.

```r
library(stringr)
infobox_dataframe1 <- infobox_dataframe %>%
  filter(key == "Political party" | key == "Children") 
data1 <- data.frame(key = c("Full name"), value = colnames(infobox)) %>%
  head(1)
infobox_dataframe1 <- rbind(data1, infobox_dataframe1)
infobox_dataframe1
```

```
##               key           value
## 1       Full name Mitch McConnell
## 2 Political party      Republican
## 3        Children               3
```

## 4. Make a function


```r
get_wiki_info <- function(url) {
  url_wiki <- url
  wiki <- read_html(url_wiki)
  infobox <- wiki %>%
  html_node(".infobox.vcard") %>%
  html_table() 
  infobox_dataframe <- as.data.frame(infobox)
  colnames(infobox_dataframe) <- c("key", "value")
  infobox_dataframe1 <- infobox_dataframe %>%
  filter(key == "Political party" | key == "Children") 
  data1 <- data.frame(key = c("Full name"), value = colnames(infobox)) %>%
  head(1)
  infobox_dataframe1 <- rbind(data1, infobox_dataframe1)
  infobox_dataframe1
}  

get_wiki_info("https://en.wikipedia.org/wiki/Tammy_Duckworth")
```

```
##               key           value
## 1       Full name Tammy Duckworth
## 2 Political party      Democratic
## 3        Children               2
```

```r
get_wiki_info("https://en.wikipedia.org/wiki/Susan_Collins")
```

```
##               key         value
## 1       Full name Susan Collins
## 2 Political party    Republican
```

Fix the function.

```r
get_wiki_info <- function(url) {
  url_wiki <- url
  wiki <- read_html(url_wiki)
  infobox <- wiki %>%
  html_node(".infobox.vcard") %>%
  html_table() 
  infobox_dataframe <- as.data.frame(infobox)
  colnames(infobox_dataframe) <- c("key", "value")
  infobox_dataframe1 <- infobox_dataframe %>%
  filter(key == "Political party" | key == "Children") 
  data1 <- data.frame(key = c("Full name"), value = colnames(infobox)) %>%
  head(1)
  infobox_dataframe1 <- rbind(data1, infobox_dataframe1)
  if (nrow(infobox_dataframe1) == 2) {
    data2 <- data.frame(key = c("Children"), value = c("NA"))
    infobox_dataframe1 <- rbind(infobox_dataframe1, data2)
    infobox_dataframe1
  } else {
  infobox_dataframe1    
  }
}  

get_wiki_info("https://en.wikipedia.org/wiki/Tammy_Duckworth")
```

```
##               key           value
## 1       Full name Tammy Duckworth
## 2 Political party      Democratic
## 3        Children               2
```

```r
get_wiki_info("https://en.wikipedia.org/wiki/Susan_Collins")
```

```
##               key         value
## 1       Full name Susan Collins
## 2 Political party    Republican
## 3        Children            NA
```

## 5. Get all senators' pages
a) Get the URLs.

```r
url_senator <- "https://en.wikipedia.org/wiki/Current_members_of_the_United_States_Senate"
html_senator <- read_html(url_senator) 
senator <- html_nodes(html_senator, ".fn a") %>%
  xml_attr("href")
link_senator <- paste("https://en.wikipedia.org",senator, sep = "")
link_senator <- as.data.frame(link_senator)
link_senator$senator <- as.character(link_senator$link_senator) 
link_senator <- link_senator %>%
  select(senator)
```

b) Create a loop that uses get_wiki_info function.

```r
results <- vector("list", 100)
for (i in 1:100) {
results[[i]] <- get_wiki_info(link_senator[i,])
}
```

c) Clean up your data to provide some summary statistics. How many children does the average senator have? What about by party affiliation?

```r
library(tidyr)
total_results <- as.data.frame(results)
total_results <- as.data.frame(t(total_results))
results_dup <- total_results[!duplicated(total_results),]
results_dup <- results_dup[-1,] 
colnames(results_dup) <- c("Full name", "Political party", "Children")
rownames(results_dup) <- NULL
results_dup[9,3] <- 1
results_dup[30,3] <- 3
results_dup[36,3] <- 1
results_dup[43,3] <- 2
results_dup[50,3] <- 4
results_dup[59,3] <- 2
results_dup[61,3] <- 1
results_dup[90,3] <- 1
results_dup[95,3] <- 3
results_dup$Children <- as.numeric(as.character(results_dup$Children))
```

```
## Warning: NAs introduced by coercion
```

```r
mean(results_dup$Children, na.rm = TRUE)
```

```
## [1] 2.747126
```
The senators have 2.75 children on average.



```r
democratic_senator <- filter(results_dup, grepl('Democratic', `Political party`)) 
nrow(democratic_senator)
```

```
## [1] 47
```

```r
mean(democratic_senator$Children, na.rm = TRUE)
```

```
## [1] 2.447368
```
There are 47 senators from Democratic party and have 2.45 children on average.


```r
republican_senator <- filter(results_dup, grepl('Republican', `Political party`)) 
nrow(republican_senator)
```

```
## [1] 51
```

```r
mean(republican_senator$Children, na.rm = TRUE)
```

```
## [1] 2.978723
```

There are 51 senators from Republican party and have 2.98 children on average.
