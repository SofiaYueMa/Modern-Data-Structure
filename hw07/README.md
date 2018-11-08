# Calling an API using httr
For this assignment, we want to get familiar with the httr package and request a data set with multiple records.

For the exercise, we will be using LA crime data. Here is the description of the API.

## 1. Define the base URL
In the documentation, find the API Endpoint for csv (Hint: if there is a json at the end, replace json with csv).

endpoint <- ... URL of API endpoint ...

## 2. Send a simple GET request
Using httr, send a simple GET request to the base URL. Check for the status and structure of the response (print only the first level in your ouput using the option max.level).

## 3. Get the content of the response
Retrieve the content of the response. What are the dimensions of the data frame? Tabulate the areas of the observations included.

## 4. Get your access token
As you have noticed, our initial request yieled only a small part of the data. For full access (actually the API seems not to care much, but for exercise's sake let's do it), you will need an API key to access the data. Sign up here https://data.lacity.org/profile/app_tokens and get your token.

To keep your key safe, it is always better not to add it to your code. Place your token in the R environment file (as shown in class). Add the following lines (with your access info) to the .Renviron file. (Note: if you have trouble, take a look at this more extended discussion of the .Renviron file.)

 App Token for https://data.lacity.org
LACRIME_APP_TOKEN = ...
LACRIME_SECRET_TOKEN =  ...
Now, resend your query with the fields: "$limit" = "10000" and "$$app_token" = Sys.getenv("LACRIME_APP_TOKEN") as query parameters and show the status of the server response.

## 5. Limiting your query
Choose at least two more query field parameters from the API description [the blueish list on the bottom of the page], pass them to the query parameter list, and run the query (providing the server status again). Describe briefly in words what your query is selecting.

## 6. Locations
The dataset already provides us with good geographic information on latitude and longitude and some address information (for privacy reasons, the locations are approximate).

Let's try to use the Google Maps reverse geocode API to find the addresses for some locations.

The query we will need to look like this:

/ads.html/fabric

The documentation of the API is here.

Write a loop to find the addresses for 50 entries in your dataset based on their latitude and longitude. The object you get back is a bit verbose -- aim for the formatted_address part. In the loop, add a status check (using an if statement) that will warn us if something goes awry. Lastly, add a Sys.sleep pause of 0.1 seconds after each URL retrieval to make sure we use the Google Maps API responsibly.
