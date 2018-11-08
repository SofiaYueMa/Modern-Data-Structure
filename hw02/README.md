## The objective of this assignment is to wrangle a data set, produce some summary statistics, and visualize the correlation between binge drinking prevalence and poverty in U.S. States.

# Data
The data we want to use are the U.S. Chronic Disease Indicators (CDI). Download the data in .csv format (use the read_csv() in the readr package to load that file into R). Also, please exclude that data file from uploading to your Github repository by adding it to your .gitignore file.

# Selection of Data and Tidying
The data contains lots of indicators and is in a non-tidy format.

## 1. Remove all columns you do not need for the analysis (All done in R, of course. No Excel acrobatics.).
## 2. We are interested in two sets of variables. Select the following variables and remove all others: a) Binge Drinking: Binge drinking prevalence among adults aged >= 18 years, Crude Prevalence in Percent. We would like to obtain this variable for the overall population, as well separately for females and males. b) Poverty: Poverty, Crude Prevalence in Percent. We only want the overall poverty prevalence to make things a bit easier.
## 3. Convert the dataset to a tidy data set using the commands from the tidyr package.
## 4. Rename the variables to follow the format below.
Your dataset should now be in a tidy state-year format with the following variables:

state: Name of the State
stateabb: State Abbreviation
year: year of observation
binge_all: Binge drinking prevalence among all adults aged >= 18 years
binge_male: Binge drinking prevalence among male adults aged >= 18 years
binge_female: Binge drinking prevalence among female adults aged >= 18 years
poverty: Poverty, Crude Prevalence in Percent
Save the cleaned dataset as binge_clean.csv. That file should be included in the uploaded files for your homework submission.

# Data Transformation and Summary Results
## 5. Produce a table that shows the overall, female, and male binge drinking prevalences across U.S. States in the most recent year of data for the Top 10 binge drinking states (i.e. the ones with the highest prevalence in the overall population). Use the relevant dplyr commands to select the right variables, sort the data (arrange()), and filter the data frame.

## 6. Make a simple scatter plot showing the correlation between the overall poverty prevalence in a state and the prevalence of binge drinking in the overall population. I suggest to use ggplot. Add a loess smoothed fit curve (use geom_smooth in the ggplot2 package) to indicate the pattern. Comment briefly.

## 6. Calculate the average annual growth rates (in percent) of overall binge drinking across states for the years the data is available. One way to get these growth rates, is to group the data by state (dplry::group_by) and use the first() and last() commands in the summarize command followed by dividing the calculated percentage increase by the number of years. Provide a table of the 5 states with the largest increases and the 5 states with the largest decreases in binge drinking prevalence over the time period.
