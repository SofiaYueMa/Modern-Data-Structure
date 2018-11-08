# This short exercise is meant to make sure that all students have set up their Github account correctly, are able to write a simple RMarkdown document, and can submit their solution to their own private repository on Github.

# R Markdown
# 1. Create R Markdown document
From the instructions, you should have created a bare bones RMarkdown file that outputs a .html file and a GitHub flavored .md document. If you have not, the instructions for this homework itself have the configuration you are looking for.

Make sure to insert a YAML Header with title, author and date at the top of your .Rmd script.

# 2. Get some data
Let's get some data from our friends at fivethirtyeight.com.

For an easy way do so, install this user-created package:

If you haven't installed devtools yet, do so:
install.packages("devtools")
devtools::install_github("rudeboybert/fivethirtyeight")
library(fivethirtyeight)

See an overview of what kind of data is included
data(package = "fivethirtyeight")
Choose a data set that interests you. Typing ?name_of_your_dataset will allow you to find a bit more information on what the variables mean and what article the data was used for.

In your write up, very briefly describe the dataset and link to the fivethirtyeight.com article.

Manually create a small table for your dataframe with two columns: variable name and variable description. Include a few variables in the table.

# 3. Show the data
Provide a simple summary of the data with summary() command.

Use the command datatable from the package DT to show an interactive table of your data in the document. Notice that the interactive table will show in your html output (which allows interactivity) and not show in your .md rendered document (which does not allow interactivity).

Now add another non-interactive table using the kable function in the knitr package. Choose a sensible subset of the data (or a transformation of the data) to show. Prettify the column names a bit.

Note: Only show the output - hide all code, messages, warnings etc.

# 4. Add some Latex formulas
Think of some (any) model you run on the data you chose. This does not need to be sensible - for this homework, the formatting is the objective, the content is secondary. Briefly describe the model using a Latex formula in the text.

# 5. Add a plot
Make a simple plot (e.g. a scatter plot) showing some feature of the data. I'd suggest using the package ggplot2 but base-R plots are fine. Add the plot to the output. Make sure there is a plot title, axes are labeled etc. -- one should be able to read off the plot alone what is being shown.

# 6. Add a picture
Find a picture that is related to the data you choose, donwload it to an \images\ folder that you create in your hw01 directory and include the picture in your output. Add a whitty comment if you are so inclined to humour your TA.

# 7. More Markdown
Using the R Markdown quick reference do the following in a short illustrative example of your choice:

Add a footnote.
Add a block quote.
