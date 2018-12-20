---
title: "Final Submission Homework 8 of Yue Ma"
author: "Yue Ma"
date: "11/15/2018"
always_allow_html: yes
output: 
   html_document:
     keep_md: true
---



# Writing a simple API client

## 1. Choose an API

a) I choose Yelp Business search API, I can get the data about businesses by keyword, category, location, price level, etc using this API.

b) The link to the API documentation is : https://www.yelp.com/developers/documentation/v3/business_search

c) The base URL of Yelp business search API I intend to use is : https://api.yelp.com/v3/businesses/search

## 2. Authentication

a) Briefly explain how the API authenticates the user:
Yelp Fusion API uses private API Keys to authenticate requests. To authenticate the call to an endpoint, there are only 2 steps: The first step is to create an app to obtain your private API Key. The second step is to authenticate API calls with the API Key.

b) To get my API key, I firstly create APP in the url: https://www.yelp.com/developers/v3/manage_app. After getting my API key, I save your account key in the .Renviron file:
## Yelp Fusion API Key
Yelp_Fusion_Key = b83YP7YDDX...
Then, I authenticated API calls with the API Key by setting the Authorization HTTP header value as Bearer API_KEY.(details see below in 3 part)
The relevant URL is: https://www.yelp.com/developers/documentation/v3/authentication

## 3. Send a Simple GET request

```r
library(httr)
library(purrr)
API_key <- Sys.getenv("Yelp_Fusion_Key")
baseurl_yelp <- "https://api.yelp.com/v3/businesses/search"
term <- "restaurants"
location <- "New York City"
limit <- 50
radius <- 16094
r <- GET(baseurl_yelp,
         query = list(term = term, location = location, 
                               limit = limit,
                               radius = radius),
         add_headers('Authorization' = paste("Bearer", API_key)))
http_status(r)
```

```
## $category
## [1] "Success"
## 
## $reason
## [1] "OK"
## 
## $message
## [1] "Success: (200) OK"
```

```r
http_type(r)
```

```
## [1] "application/json"
```

I choose 4 query parameters here: term, location, limit and radius.
I want to find all Dunkin Donuts locations within 10 miles (16094 meters) of New York City:
The term is business name with "restaurants".
The location indicates the geographic area to be used when searching for businesse with "New York City".
The limit indicates the number of business results to return with "50".
The radius is used as a suggestion to the search within 10 miles (16094 meters).

As the results above, the status of the request is 200 (success), the type of the response is JSON.

## 4. Parse the response and Create a dataset
a) Take the response returned by the API and turn it into a data frame. Show the code how this is done.

```r
r
```

```
## Response [https://api.yelp.com/v3/businesses/search?term=restaurants&location=New%20York%20City&limit=50&radius=16094]
##   Date: 2018-11-16 00:06
##   Status: 200
##   Content-Type: application/json
##   Size: 48.6 kB
```

The results above show the response returned by the API.


```r
library(jsonlite)
```

```
## 
## Attaching package: 'jsonlite'
```

```
## The following object is masked from 'package:purrr':
## 
##     flatten
```

```r
cont <- r$content
char <- rawToChar(r$content)
df <- fromJSON(char, simplifyDataFrame = TRUE)
typeof(df)
```

```
## [1] "list"
```

```r
names(df)
```

```
## [1] "businesses" "total"      "region"
```

```r
names(df$businesses)
```

```
##  [1] "id"            "alias"         "name"          "image_url"    
##  [5] "is_closed"     "url"           "review_count"  "categories"   
##  [9] "rating"        "coordinates"   "transactions"  "price"        
## [13] "location"      "phone"         "display_phone" "distance"
```
I turn it into a usefsul R object - list, seen as above, including business, total and region.
The business is a dataframe showing some usesful information, including id, alias, name, review account, rating, phone number, price, and distance. 

b) Create a dataset (in data frame format) for multiple records.

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

```
##                       id             name rating review_count
## 1 ETgJqJHV7BW6pIr9Ox74sA           Amélie    4.5         2232
## 2 jjJc_CrkB2HodEinB6cWww         LoveMama    4.0         3554
## 3 CwOAKJdX8AMz5iAoA-ZEuA     Uglyduckling    4.0          391
## 4 8Oo2AtQEPDfxIOnA8wfXoQ              886    4.0          150
## 5 pL2tig3FxJcrZ4wDIO4TsA  Eataly Downtown    3.5          703
## 6 UA2M9QFZghe-9th2KwLoWQ Burger & Lobster    4.0         4608
##   location.address1 location.address2 location.address3 location.city
## 1       22 W 8th St                                          New York
## 2       174 2nd Ave                                          New York
## 3      166 Smith St                                          Brooklyn
## 4 26 Saint Marks Pl                                <NA>      New York
## 5    101 Liberty St              Fl 3                        New York
## 6      39 W 19th St                                          New York
##   location.zip_code location.country location.state
## 1             10011               US             NY
## 2             10003               US             NY
## 3             11201               US             NY
## 4             10003               US             NY
## 5             10006               US             NY
## 6             10011               US             NY
##                   location.display_address price        phone distance
## 1          22 W 8th St, New York, NY 10011    $$ +12125332962 3036.049
## 2          174 2nd Ave, New York, NY 10003    $$ +12122545370 2858.773
## 3         166 Smith St, Brooklyn, NY 11201    $$ +17184513825 2174.284
## 4    26 Saint Marks Pl, New York, NY 10003    $$ +16468820231 2638.080
## 5 101 Liberty St, Fl 3, New York, NY 10006    $$ +12128972895 1543.309
## 6         39 W 19th St, New York, NY 10011    $$ +16468337532 3852.219
```
I create the dataset called NYC_restaurant, which indicates some usesful information of restaurants within 10 miles of New York City (the region center is (-73.99429, 40.70544)). The dataframe above shows 6 rows of the dataset. Due to the API limit with maximum of 50, I can just create a dataset with size of 50 maximum. The full size dataset is the file called __data.rds__.

c) Provide some summary statistics of the data.

```
##       id                name               rating      review_count   
##  Length:50          Length:50          Min.   :3.50   Min.   :  16.0  
##  Class :character   Class :character   1st Qu.:4.00   1st Qu.: 253.8  
##  Mode  :character   Mode  :character   Median :4.00   Median : 672.5  
##                                        Mean   :4.22   Mean   :1091.9  
##                                        3rd Qu.:4.50   3rd Qu.:1558.8  
##                                        Max.   :5.00   Max.   :5480.0  
##     price              phone              distance     
##  Length:50          Length:50          Min.   : 323.2  
##  Class :character   Class :character   1st Qu.:1743.6  
##  Mode  :character   Mode  :character   Median :2639.2  
##                                        Mean   :3153.9  
##                                        3rd Qu.:4048.5  
##                                        Max.   :9167.0
```

```
## 
##  $$ $$$ 
##  47   2
```

```
##                     name
## 1 Boucherie West Village
## 2      Antica Ristorante
```
From the results above, we can get the conclusion below: (analysis based on 50 restaurants showed within 10 miles of NYC)
1. The mean of the restaurant rating is 4.22 out of 5.00, which indicates that the quality of the targeted restaurants is high.
2. The mean of the review counts of the restaurant is 1121.6, the restaurant with the most review counts is Joe's Shanghai with 5480 reviews; the restaurant with the least review counts is Bernie's with 16 reviews.
3. The mean of the distance of the restaurant is 3168.7 meters.
4. 47 out of 50 restaurants have a price level of 2 dollars, and 2 out of 50 restaurants have a price level of 3 dollars, which indicates that most of the restaurants have a modest price. The 2 restuarants with higher price level are Boucherie West Village, and Antica Ristorante.

## 5. API Client

```r
yelp_business_search <- function(term = "food", location = "New York City", 
                                 radius = "16094", limit = "10", return_type = "dataframe") {
  
  baseurl_yelp <- "https://api.yelp.com/v3/businesses/search"
  r <- GET(baseurl_yelp,
         query = list(term = term, location = location, 
                               limit = limit,
                               radius = radius),
         add_headers('Authorization' = paste("Bearer", API_key)))
  if (http_error(r)){
    warning("The request produced an error.")
  } else {
    r
    cont <- r$content
    char <- rawToChar(r$content)
    df <- fromJSON(char, simplifyDataFrame = TRUE)
  if (return_type == "dataframe"){
    finalresults <- df$businesses %>%
      select(id, name, rating, review_count, location, price, phone, distance)
    print(finalresults) 
  } else{
    df
  }
  }
}

NYC_food <- yelp_business_search(term = "food", location = "New York City", radius = "16094", limit = "10", return_type = "dataframe")
```

```
##                        id             name rating review_count
## 1  jjJc_CrkB2HodEinB6cWww         LoveMama    4.0         3554
## 2  UA2M9QFZghe-9th2KwLoWQ Burger & Lobster    4.0         4608
## 3  H4jJ7XB3CetIr1pg56CczQ    Levain Bakery    4.5         7050
## 4  ysqgdbSrezXgVwER2kQWKA  Juliana's Pizza    4.5         1835
## 5  L7_siqDfU4-ZA17YtA-SBg   Silver Factory    4.5          117
## 6  xt4sa64WOrpJvZBDPNPNYg  Jacob's Pickles    4.0         3372
## 7  CwOAKJdX8AMz5iAoA-ZEuA     Uglyduckling    4.0          391
## 8  Je2MuObgrne2wSKhD5MZ0w        TongKatsu    5.0          159
## 9  oOsJn3leUnWDfErRWMf81g             Soco    4.0         1877
## 10 -OixbLnFLCzQclxCSbUQ8w          Up Thai    4.5         1831
##    location.address1 location.address2 location.address3 location.city
## 1        174 2nd Ave                                          New York
## 2       39 W 19th St                                          New York
## 3      167 W 74th St                                          New York
## 4   19 Old Fulton St                                          Brooklyn
## 5   270 South 5th St              <NA>                        Brooklyn
## 6  509 Amsterdam Ave                                          New York
## 7       166 Smith St                                          Brooklyn
## 8   137 Rivington St                                <NA>      New York
## 9     509 Myrtle Ave                                          Brooklyn
## 10      1411 2nd Ave                                          New York
##    location.zip_code location.country location.state
## 1              10003               US             NY
## 2              10011               US             NY
## 3              10023               US             NY
## 4              11201               US             NY
## 5              11211               US             NY
## 6              10024               US             NY
## 7              11201               US             NY
## 8              10002               US             NY
## 9              11205               US             NY
## 10             10021               US             NY
##                 location.display_address price        phone  distance
## 1        174 2nd Ave, New York, NY 10003    $$ +12122545370 2858.7729
## 2       39 W 19th St, New York, NY 10011    $$ +16468337532 3852.2189
## 3      167 W 74th St, New York, NY 10023    $$ +12128746080 8367.1971
## 4   19 Old Fulton St, Brooklyn, NY 11201    $$ +17185966700  323.2051
## 5   270 South 5th St, Brooklyn, NY 11211    $$ +13477253017 3039.9238
## 6  509 Amsterdam Ave, New York, NY 10024    $$ +12124705566 9166.9647
## 7       166 Smith St, Brooklyn, NY 11201    $$ +17184513825 2174.2839
## 8   137 Rivington St, New York, NY 10002    $$ +12122543246 1676.9668
## 9     509 Myrtle Ave, Brooklyn, NY 11205    $$ +17187831936 2819.7511
## 10      1411 2nd Ave, New York, NY 10021    $$ +12122561188 7796.9127
```

```r
saveRDS(NYC_food, file = "api_client_output.RDS")
```

The above returns for the default values.


```r
yelp_business_search(term = "sports", location = "PA", radius = "16094", limit = "5", return_type = "list")
```

```
## $businesses
##                       id                                      alias
## 1 Edwz_unf39oePX5M7d4S3g             philly-team-store-philadelphia
## 2 lKlRRS26_eTA_eCjrWBT4w          shibe-vintage-sports-philadelphia
## 3 1_ncjo8eEq3ggPgj5YZO8A lloyd-sixsmith-sporting-goods-philadelphia
## 4 RDn9X7jN9dXba3ZePxy70w      modells-sporting-goods-philadelphia-8
## 5 WaFQd1hZAvnOM6iV8RsNiw      modells-sporting-goods-philadelphia-6
##                            name
## 1             Philly Team Store
## 2          Shibe Vintage Sports
## 3 Lloyd Sixsmith Sporting Goods
## 4       Modell's Sporting Goods
## 5       Modell's Sporting Goods
##                                                              image_url
## 1 https://s3-media3.fl.yelpcdn.com/bphoto/p36yJQwcTpoDfLVsa30c6w/o.jpg
## 2 https://s3-media1.fl.yelpcdn.com/bphoto/PmFUqYgzOlZdJI32Vxj7pw/o.jpg
## 3 https://s3-media1.fl.yelpcdn.com/bphoto/cX2rzypM18C3KCL58POn-g/o.jpg
## 4 https://s3-media4.fl.yelpcdn.com/bphoto/2efaMp_kcMT8H4CJ-PWzDA/o.jpg
## 5 https://s3-media3.fl.yelpcdn.com/bphoto/g9vFL9YwDf2E2ZrlaMeOSg/o.jpg
##   is_closed
## 1     FALSE
## 2     FALSE
## 3     FALSE
## 4     FALSE
## 5     FALSE
##                                                                                                                                                                                                       url
## 1             https://www.yelp.com/biz/philly-team-store-philadelphia?adjust_creative=7nhWE6EHFLP9cf7CRhkwJQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7nhWE6EHFLP9cf7CRhkwJQ
## 2          https://www.yelp.com/biz/shibe-vintage-sports-philadelphia?adjust_creative=7nhWE6EHFLP9cf7CRhkwJQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7nhWE6EHFLP9cf7CRhkwJQ
## 3 https://www.yelp.com/biz/lloyd-sixsmith-sporting-goods-philadelphia?adjust_creative=7nhWE6EHFLP9cf7CRhkwJQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7nhWE6EHFLP9cf7CRhkwJQ
## 4      https://www.yelp.com/biz/modells-sporting-goods-philadelphia-8?adjust_creative=7nhWE6EHFLP9cf7CRhkwJQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7nhWE6EHFLP9cf7CRhkwJQ
## 5      https://www.yelp.com/biz/modells-sporting-goods-philadelphia-6?adjust_creative=7nhWE6EHFLP9cf7CRhkwJQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7nhWE6EHFLP9cf7CRhkwJQ
##   review_count                                         categories rating
## 1            6                            sportswear, Sports Wear    4.0
## 2           18 sportswear, souvenirs, Sports Wear, Souvenir Shops    4.5
## 3            2                            sportswear, Sports Wear    4.5
## 4           19                         sportgoods, Sporting Goods    2.5
## 5            6                         sportgoods, Sporting Goods    2.5
##   coordinates.latitude coordinates.longitude transactions price
## 1             39.95129             -75.16965         NULL    $$
## 2             39.94953             -75.16181         NULL    $$
## 3             40.03957             -75.03400         NULL    $$
## 4             39.95083             -75.16692         NULL    $$
## 5             39.92212             -75.18604         NULL    $$
##    location.address1 location.address2 location.address3 location.city
## 1   1720 Chestnut St              <NA>                    Philadelphia
## 2      137 S 13th St                                      Philadelphia
## 3 7554 Frankford Ave                                      Philadelphia
## 4   1528 Chestnut St                                      Philadelphia
## 5     2437 S 24th St                                      Philadelphia
##   location.zip_code location.country location.state
## 1             19103               US             PA
## 2             19107               US             PA
## 3             19136               US             PA
## 4             19102               US             PA
## 5             19145               US             PA
##                     location.display_address        phone  display_phone
## 1   1720 Chestnut St, Philadelphia, PA 19103 +12159415002 (215) 941-5002
## 2      137 S 13th St, Philadelphia, PA 19107 +12155662511 (215) 566-2511
## 3 7554 Frankford Ave, Philadelphia, PA 19136 +12156246670 (215) 624-6670
## 4   1528 Chestnut St, Philadelphia, PA 19102 +12159728080 (215) 972-8080
## 5     2437 S 24th St, Philadelphia, PA 19145 +12152713573 (215) 271-3573
##     distance
## 1   306.6511
## 2   936.3252
## 3 15088.1379
## 4   491.8041
## 5  3740.6637
## 
## $total
## [1] 434
## 
## $region
## $region$center
## $region$center$longitude
## [1] -75.1712
## 
## $region$center$latitude
## [1] 39.95378
```

The above returns the values with list.


```r
yelp_business_search(term = "sports", location = "PA", radius = "160940", limit = "5", return_type = "list")
```

```
## Warning in yelp_business_search(term = "sports", location = "PA", radius =
## "160940", : The request produced an error.
```

The above informs the user of any errors.

