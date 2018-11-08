
columnsummary
=============

The goal of columnsummary is to do summary on all the numeric columns in a data frame.

Installation
------------

You can install the released version of columnsummary from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("columnsummary")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
col_sum <- function(x = mpg, f = mean) {
  library(purrr)
  library(maps)
  x <- keep(x, is.numeric)
  map_dbl(x, f)
}

col_sum(iris, median)
#> 
#> Attaching package: 'maps'
#> The following object is masked from 'package:purrr':
#> 
#>     map
#> Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
#>         5.80         3.00         4.35         1.30
```
