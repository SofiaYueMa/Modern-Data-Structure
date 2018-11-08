---
title: "Final submission homework 7 of Yue Ma"
author: "Yue Ma"
date: "11/5/2018"
always_allow_html: yes
output: 
   html_document:
     keep_md: true
---



# Calling an API using httr

## 1. Define the base URL


```
## [1] "/Library/Frameworks/R.framework/Resources"
```

```
## [1] "https://data.lacity.org/resource/7fvc-faax.csv"
```

## 2. Send a simple GET request

```
## List of 10
##  $ url        : chr "https://data.lacity.org/resource/7fvc-faax.csv"
##  $ status_code: int 200
##  $ headers    :List of 19
##   ..- attr(*, "class")= chr [1:2] "insensitive" "list"
##  $ all_headers:List of 1
##  $ cookies    :'data.frame':	0 obs. of  7 variables:
##  $ content    : raw [1:333364] 22 3a 40 63 ...
##  $ date       : POSIXct[1:1], format: "2018-11-08 21:12:05"
##  $ times      : Named num [1:6] 0 0.00941 0.01791 0.08659 0.15969 ...
##   ..- attr(*, "names")= chr [1:6] "redirect" "namelookup" "connect" "pretransfer" ...
##  $ request    :List of 7
##   ..- attr(*, "class")= chr "request"
##  $ handle     :Class 'curl_handle' <externalptr> 
##  - attr(*, "class")= chr "response"
```

From the information above, we can see that the status code starts with 2, so it is great.
The structure of the response is as above as well.

## 3. Get the content of the response

```
## Parsed with column specification:
## cols(
##   .default = col_character(),
##   `:@computed_region_2dna_qi2s` = col_integer(),
##   `:@computed_region_k96s_3jcv` = col_integer(),
##   `:@computed_region_kqwf_mjcx` = col_integer(),
##   `:@computed_region_qz3q_ghft` = col_integer(),
##   `:@computed_region_tatf_ua23` = col_integer(),
##   `:@computed_region_ur2y_g4cx` = col_integer(),
##   crm_cd = col_integer(),
##   crm_cd_1 = col_integer(),
##   crm_cd_2 = col_integer(),
##   crm_cd_3 = col_integer(),
##   crm_cd_4 = col_integer(),
##   date_occ = col_datetime(format = ""),
##   date_rptd = col_datetime(format = ""),
##   dr_no = col_integer(),
##   premis_cd = col_integer(),
##   vict_age = col_integer(),
##   weapon_used_cd = col_integer()
## )
```

```
## See spec(...) for full column specifications.
```

```
## [1] 1000   36
```

```
## 
## 77th Street     Central  Devonshire    Foothill      Harbor  Hollenbeck 
##          50          59          33          37          16          35 
##   Hollywood     Mission N Hollywood      Newton   Northeast     Olympic 
##          75          75          52          39          29          75 
##     Pacific     Rampart   Southeast   Southwest     Topanga    Van Nuys 
##          25          34          59          66          81          28 
##     West LA West Valley    Wilshire 
##          33          28          71
```

There are 1000 observations of 36 variables in the data frame. The table shows the areas of the observations included.

## 4. Get your access token

```
## [1] 200
```
From the result above, after resending the query with the fields: "limit" = "10000" and "app_token" = Sys.getenv("LACRIME_APP_TOKEN") as query parameterswe, we can see that the status of the server response with 200 is great.

## 5. Limiting your query

```
## [1] 200
```

I added two more query field parameters - area id and victim sex. I select area id = 01, which selects Central area. I aslo select victim sex = M, which selects male victims.
The status of the server response is 200, so it is still great.

## 6. Locations

```
## 
## Attaching package: 'plyr'
```

```
## The following object is masked from 'package:purrr':
## 
##     compact
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:plyr':
## 
##     arrange, count, desc, failwith, id, mutate, rename, summarise,
##     summarize
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

```
## Warning: Expected 2 pieces. Additional pieces discarded in 50 rows [1, 2,
## 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...].
```

```
## [1] "144 W 18th St, Los Angeles, CA 90015, USA"
## [1] "935 N Vignes St, Los Angeles, CA 90012, USA"
## [1] "861 Fedora St, Los Angeles, CA 90005, USA"
## [1] "53 S Santa Fe Ave, Los Angeles, CA 90013, USA"
## [1] "452 E 3rd St, Los Angeles, CA 90013, USA"
## [1] "528 San Julian St, Los Angeles, CA 90013, USA"
## [1] "20557 Sherman Way, Winnetka, CA 91306, USA"
## [1] "550 N Figueroa St, Los Angeles, CA 90012, USA"
## [1] "300 E 5th St, Los Angeles, CA 90013, USA"
## [1] "712 S Figueroa St, Los Angeles, CA 90017, USA"
## [1] "501 S Grand Ave, Los Angeles, CA 90071, USA"
## [1] "238 S Westmoreland Ave, Los Angeles, CA 90004, USA"
## [1] "13733 Oscar St, Sylmar, CA 91342, USA"
## [1] "617A W 7th St, Los Angeles, CA 90017, USA"
## [1] "Wilshire EB & Grand NS, Los Angeles, CA 90017, USA"
## [1] "6th / Wall, Los Angeles, CA 90014, USA"
## [1] "814 S Francisco St, Los Angeles, CA 90017, USA"
## [1] "206 E 14th St, Los Angeles, CA 90015, USA"
## [1] "1200 S Hope St, Los Angeles, CA 90015, USA"
## [1] "990 W 8th St, Los Angeles, CA 90017, USA"
## [1] "629 San Julian St, Los Angeles, CA 90014, USA"
## [1] "1200 S Hope St, Los Angeles, CA 90015, USA"
## [1] "300 E 5th St, Los Angeles, CA 90013, USA"
## [1] "963 W 2nd St, Los Angeles, CA 90012, USA"
## [1] "425 S Main St, Los Angeles, CA 90013, USA"
## [1] "557-599 S Hope St, Los Angeles, CA 90071, USA"
## [1] "5019 E 18th St, Los Angeles, CA 90015, USA"
## [1] "320 W 4th St, Los Angeles, CA 90013, USA"
## [1] "Lucky Strike Bowling - Los Angeles, 800 W Olympic Blvd, Los Angeles, CA 90015, USA"
## [1] "529 Maple Ave, Los Angeles, CA 90013, USA"
## [1] "814 S Francisco St, Los Angeles, CA 90017, USA"
## [1] "218 N Hope St, Los Angeles, CA 90012, USA"
## [1] "645 W 4th St, Los Angeles, CA 90071, USA"
## [1] "501 E 4th St, Los Angeles, CA 90013, USA"
## [1] "231 Winston St, Los Angeles, CA 90013, USA"
## [1] "400 Alameda St, Los Angeles, CA 90013, USA"
## [1] "501 S Grand Ave, Los Angeles, CA 90071, USA"
## [1] "501 S Grand Ave, Los Angeles, CA 90071, USA"
## [1] "701 N Spring St, Los Angeles, CA 90012, USA"
## [1] "679 E 5th St, Los Angeles, CA 90013, USA"
## [1] "506 E 1st St, Los Angeles, CA 90012, USA"
## [1] "323 E 5th St, Los Angeles, CA 90013, USA"
## [1] "8 W 8th St, Los Angeles, CA 90014, USA"
## [1] "810 N Alameda St, Los Angeles, CA 90012, USA"
## [1] "United States, California, Los Angeles, 1100 South San Pedro Street D-4 & D-5"
## [1] "766 W College St, Los Angeles, CA 90012, USA"
## [1] "College St. & Figueroa Terrace, Los Angeles, CA 90012, USA"
## [1] "4601 Del Moreno Dr, Woodland Hills, CA 91364, USA"
## [1] "20308 Hart St, Winnetka, CA 91306, USA"
## [1] "320 W 4th St, Los Angeles, CA 90013, USA"
```
From the results above, we can see the addresses for 50 entries in my dataset based on their latitude and longitude. 
