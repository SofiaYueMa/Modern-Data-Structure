# for Loops & Functions
# 1. Beer Song
Consider the song "99 Bottles of Beer on the Wall". It goes something like this:

99 bottles of beer on the wall, 99 bottles of beer.
Take one down, pass it around, 98 bottles of beer on the wall...
The same verse is repeated, each time with one bottle fewer, until there are none left. The last verse following the last bottle going down is:

No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall..
a) Write a loop
Write a for loop that will iterate the main verse from 99 to 1. End with the last verse.

Print steps 99 to 95 (that is from 99 bottles to 95 bottles) to the console. Show the loop code and the print output in your solution. (Hint: the cat() function may be useful to concatenate the output you want.)

b) Convert loop to a function
Now convert the loop into a function. Generalize to any type of liquid and a variable number of bottles (but assume the number of bottles entered is larger or equal to 3). Set the default values of your function arguments to the original song. Show the function code in your solution and print the output using the following values: 3, Whiskey.

c) Add error check
Add an error check to produce a warning when a user passes a non-numeric input to the number of bottles.

d) BONUS (optional): Convert loop to a fully generalized function
Generalize to any number (i.e no longer assume a minimum of 3) of any vessel containing liquid on any surface. Set the default values of your function arguments to the original song. Show the function code in your solution and print the output using the following values: 3, jugs, milk, shelf.

# 2. Draw a plot using a loop
Let's draw a plot with a loop. You can inialize a new plot with plot(). Lines can be added to a plot with lines() command. For example, lines(x = c(1,1), y = c(1,7)) will draw a line between the coordinates (1,1) and (1,7).

So, as an example to get you started:

plot(1, type="n", xlab="", ylab="", xlim = c(0, 10), ylim = c(0, 10))
lines(x = c(1,1), y = c(1,7))
points(x = 3, y = 7)


a) Plot with horizontal lines
Initialize a plot. Add 11 horizontal lines (from 0 to 10) using a for loop. Show the code of the loop and the plot in the output.

b) Add vertical lines
Extend the previous code, but now also add 11 vertical lines. Show the code and the changed plot in the output.

c) Add points
Lastly, add points() to the plot to all coordinate points where the lines intersect on the diagonals (that is the 45 and -45 degree lines). E.g. x=1,y=1 ... x=1,y=9 etc. Again, show the code and the changed plot output.

d) Convert to function
Convert this into a function that will allow the user to set the size of the plot (the plot should be square) and which items to draw (horizontal lines, vertical lines, points on the diagonal). Show the function you have written but no other output. Make sure the arguments of the function are set to sensible default values.

NOTE: In light of the time students took for the previous homework exercise, the following question has been removed from the homework set and is now JUST FOR ADDITIONAL PRACTICE. No points are awarded but I will post the solution for this part if there is demand.

# Descriptive Statistics of a Vector with Error Checks (NOT REQUIRED!)
Write a desc_stats() function that calculates some descriptive statistics for a vector.

a) Calculate min and max
Write a function that takes a vector as input and prints its minimum and maximum. Make sure to remove any NAs from the vector before the calculations.

b) Add the median
Add an additional argument to the function (set to FALSE by default) that will allow a user to calculate the median of the vector as well. If the median is calculated, round it to two digits (hint: use the function round()).

c) Add error checks
Try your function on an empty vector z1 <- c() and a vector containing only NAs. You probably get a rather cryptic error. Alter your function so that it stops when a user supplies an empty vector or a vector with only NAs and gives a short warning about the issue. I suggest to use the return() function for this as the first step of your function.


