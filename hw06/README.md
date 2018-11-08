# Working with Strings
## 1. Words in Ulysses
For our first exercise, we will analyze a major work by James Joyce entitled "Ulysses". Follow the code below to download the book from project Gutenberg and transform the lines of the book into a words dataframe.

a) Words with z
Select all unique words that contain at least one z. Among the z-words, tabulate how many z's the words contain (i.e. how many words contain one z, two z's etc.). Find the z-word(s) with z's that are as far apart as possible (i.e. we are interested in the distance between two z's in the word. That means the word could contain more than two z's.).

Hint: You can focus on the distance between consecutive z's. In this example, it does not make a difference to generalize to the distance between more than two z's in the word and it is easier to do.

b) Vowels
How many unique words start and end with a vowel? Are there words that start with two or more vowels? Find and display the word(s) with the most consecutive vowels (anywhere in the word).

c) English spelling
Empirically verify the rule “i before e except after c”. No need to become a linguist here; simply tabulate the proportion of words when the rule holds and when it does not.

## 2. MTA Delays
The file mta.RDS contains a dataframe of tweets on the New York City subway services' official twitter account (@NYCTSubway). Let's try to extract some structured data from these tweets.

a) Reduce the data to direct tweets only by removing any retweets (variable is_retweet = TRUE) and replies to other users (starting with @username). Also only keep the columns text and created_at.

b) Time of Delay

Let's focus on tweets that identify a delay in the service of one or more train lines. Here is an example:

Northbound 2 and 3 trains are running with delays because of signal problems at 14 St.

Identify a pattern (or a combined set of patterns) to subset only tweets that identify the start of a delay. Explain briefly the choices you made here. We are not interested in notices of resumed services, updates etc. like this tweet:

L train service has resumed with delays following an earlier incident involving a train's brakes being automatically activated at Morgan Av.

Provide a table that shows delays by day of the week and time of day. Use the following time periods: mornings (6-10am), mid-day (10am-3pm), afternoon (3pm - 6pm), evening (6pm - 10pm), and night (10pm - 6am). What do you find?

c) Type of Delay

Among the set of tweets in part b), try to categorize the types of delays. No need to be exhaustive but try to pick up the top 3-5 reasons for delays. Combine them into reasonable categories if necessary (e.g. signal problems, medical, technical problems, etc.). Provide an overview (table or graph) of which types of delays are most common.

d) Which train lines affected?

Write a regex pattern that captures which train lines are affected by delays. We are not interested in other additional information (e.g. northbound vs. southbound, running express/local etc.). Provide a summary of which train lines are affected by weekday vs. weekend.
