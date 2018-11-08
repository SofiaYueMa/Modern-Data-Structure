# Functions II
## 1. Functions in the R Base Package
Let's get to know the functions of the R base package a bit. The following code makes a list of all functions in the base package.

content <- mget(ls("package:base"), inherits = TRUE)
base_functions <- Filter(is.function, content)
Use it to answer the following questions:

a) Longest name
Use the appropriate map function to produce a vector of the names of all functions in the base R package. Which function has the longest name?

b) Number of arguments
Use the appropriate map function to calculate the number of arguments by function. Present a table of the Top 10 functions with the most arguments. Which base function has the most arguments? Hint: Remember that the functions formals(), body(), and environment() allow you to access parts of a function.

c) No arguments
How many base functions have no arguments? What do you think is different about them?

Note: The answer may differ a bit by machine depending on your R installation. No worries about that.

## 2. Infant Mortality and GPD per Capita
For this exercise, we will use data from the World Bank to explore the relationship between infant mortality (infmort) and GPD per capita (gdpcap) over time (year).

a) Highest and lowest infant mortality rates in 2017
Use the WDI package to obtain country-year data on infant mortality and GDP per capita from the World Bank database.

The indicator short names in the World Development Indicators are:

NY.GDP.PCAP.PP.KD - GDP per capita, PPP (constant 2005 international)
SP.DYN.IMRT.IN - Mortality rate, infant (per 1,000 live births)
Make sure to obtain information about the region of the country as well (using the extra=TRUE option in the WDI() command). Specify the requested range of years from 1960 to 2017.

Rename the variables: infant mortality (infmort) and GPD per capita (gdpcap). Keep only entries for countries (i.e. remove entries for regions and the World as a whole).

Present a list of countries with the 5 highest and the 5 lowest infant mortality rates in 2017 along with their GDP per capita in that year.

b) Overall regression
Run an overall regression predicting infant mortality from GDP per capita. What do you find? Make a scatter plot (including a regression fit line).

c) Regression by region
Let's see if the overall relationship holds within world regions. Split the the data by region and create a nested list that contains these split data frames. In a single pipeline, re-estimate the regression for each of these data frames, obtain the coefficient estimates for the slope for each region and present them in a table (sorted by size of the coefficient).

d) Regression by country
Let's also check if the relationship is consistent if estimated within countries. Split the overall data by country and create a nested list that contains these split data frames.

Again, estimate a simple linear regression, predicting infant mortality by GDP per capita. In what percentage of the within-country regressions do we find a positive relationship (at the 95% confidence level) between GDP per capita and infant mortality? Make a histogram of the slope coefficients to illustrate the variation of the estimated relationship. Which country cases are most at odds with the overall regression estimated in part (b)?

Note: For some countries, there is probably insufficient or no data to estimate the model. I suggest using one of the functions dealing with error (safely / possibly) to make sure you obtain the results for the other country regressions. Alternatively, you can remove countries with insufficient data before the regressions.

e) Added squared term
Let's see if we can improve the models slightly. Using the list of country data frames from (d), estimate regressions of infant mortality on GDP per capita and the square of GDP per capita. Compare the adjusted R-Squareds of the models with and without the added squared term of GDP per capita. Provide the average model adjusted R-squared with and without the squared term. Would you recommend to keep the squared term or not?


