library(selectr)
library(rvest)
library(xml2)
library(rtweet) # for scraping tweets
library(wordcloud2) # for generating really cool looking wordclouds
library(tm) # for text minning
library(dplyr) # loads of fun stuff including piping
library(ROAuth)
library(jsonlite)
library(httpuv)

### Setting API parameters



consumer_key = "9TVmMW3pyds9CwlMhgXBK5Bu5"
consumer_secret = "lTXYO7I5nKTGOp7zJG7jtf7dCmYoQLtbgB4a0w6BZN6ct4mNxT"
access_token = "1553871190036516864-ahw9mcZ1pq36DzwsD7CFgvU0iMnOy4"
access_token_secret = "8DhWYScYuF6KofqS9Gt7ajYs7B4DZKkZSBhoMPgyfnTFp"
bearer_token = "AAAAAAAAAAAAAAAAAAAAAOfFfQEAAAAARkEQiS1bfu9c96%2FD%2FvzbetKGYZk%3DKNBdl2kUeIysZ9wV6n6O4X3zp5enoR6Onp6LqEKQVldRKaDcum"

# print(consumer_key)
# print(consumer_secret)
# print(access_token)
# print(access_token_secret)
# print(bearer_token)



### Extracting tweets

library(twitteR)

requestURL='https://api.twitter.com/oauth/request_token'
accessURL='https://api.twitter.com/oauth/access_token'
authURL='https://api.twitter.com/oauth/authorize'

s_key  = 'wemedia'
n_tweets = 250 

twitteR:::setup_twitter_oauth(consumer_key, consumer_secret,access_token,access_token_secret)
Search1<-twitteR::searchTwitter(s_key,n=n_tweets, since="2022-04-01")
# Search2<-twitteR::searchTwitter("#datascience",n=50, since="2022-01-01")
TweetsDF<- twListToDF(Search1)
#(TweetsDF$text[1])
View(TweetsDF)
### Saving the tweets to file


########## Place Tweets in a new file ###################
FName = "~/Desktop/wemediaexample.csv"
## Start the file
MyFile <- file(FName)
## Write Tweets to file
cat(unlist(TweetsDF), " ", file=MyFile, sep="\n")
close(MyFile)

