# Building your own R Package
For this homework, I want you to create a simple R Package very much like we did in class.

## Creating a package
Try to complete the following elements:

Create a new R package (either in R Studio or with devtools::create). Choose a name.

Define and export at least one new function, i.e. make it available to the user. Feel free to add more than one. The function should have at least two arguments because otherwise there is not much to describe. The function(s) should be in the R\ folder. Make sure that the NAMESPACE is updated as well (using the `@export tag). Ideally the function is of your own creation, but any of the examples we discussed will do if creativity fails you. Especially great if the functions(s) actually do something useful.

Set the function arguments to some sensible defaults, where relevant.

Edit the DESCRIPTION file of the package metadata with its title, a short description (and some more detailed description if desired), and the author/contact. Add anything else you would like.

Specify a LICENSE.

Document the package itself via use_package(), that is add all dependencies to the DESCRIPTION file.

Document all included functions via roxygen2 comments (if your functions, usage examples, or vignette require any packages to run).

Your package should pass check() without errors (warnings and notes are OK, though it would be great if there were none; try to address the issues pointed out by check()).

Add a README file. Consider using devtools::use_readme_rmd() but remove the boilerplate as necessary.

Push your package to GitHub Your usual homework folder is sufficient for the exercise. If interested, try to also put into your personal Github account to be able to install your package via devtools::install_github().

## Extra Credit:
Add some data to your package. Make sure to document it briefly. (Note: It does not matter what kind of data. Keep it light. Feel free to re-use data from another package.)

Write a vignette to show the usage of all the functions in the package. Make sure to remove boilerplate content from the vignette. Consider using devtools::use_vignette("my-vignette") for this task.

Optional (no additional points awarded):
Use assertions to add some validity checks of function input. You can use the usual functions we have discussed (i.e. if, return etc.) to return an error to the user or perhaps rely on the package ArgumentCheck.

Include some unit tests for the functions that are exported. Try adding expectations for success and for failure.



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
