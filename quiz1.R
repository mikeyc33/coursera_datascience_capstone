#===========================================================================================#
# Program Name: quiz1.R
# Program Purpose: analysis and answers for Quiz 1 in the data science capstone project
# Program Author: Mike Cui
# Creation Date: 06MAY15
# Notes:         
#===========================================================================================#


library(ggplot2)
library(dplyr)
library(tm)

setwd('/Users/mikecui/Documents/coursera/data_science_capstone/')

files <- list.files("data/final/en_US")

#Question 1: The 𝚎𝚗_𝚄𝚂.𝚋𝚕𝚘𝚐𝚜.𝚝𝚡𝚝  file is how many megabytes?

file.info("data/final/en_US/en_US.blogs.txt")$size / 1024^2

#Q2: The 𝚎𝚗_𝚄𝚂.𝚝𝚠𝚒𝚝𝚝𝚎𝚛.𝚝𝚡𝚝 has how many lines of text?
twitter <- readLines(paste0("data/final/en_US/", files[3]))
print(length(twitter))

#Q3: What is the length of the longest line seen in any of the three en_US data sets?
blogs <-  readLines(paste0("data/final/en_US/", files[1]))
news <-  readLines(paste0("data/final/en_US/", files[2]))

print(max(nchar(twitter))); print(max(nchar(blogs))); print(max(nchar(news)))

#Q4: In the en_US twitter data set, if you divide the number of lines where the word 
#"love" (all lowercase) occurs by the number of lines the word "hate" (all lowercase) occurs, 
#about what do you get?

result <- length(twitter[grepl('love', twitter)])/length(twitter[grepl('hate', twitter)])
print(result)

#Q5: The one tweet in the en_US twitter data set that matches the word "biostats" says what?
biostat <- subset(twitter, grepl('biostats', twitter))
print(biostat)

#Q6: How many tweets have the exact characters "A computer once beat me at chess, 
#but it was no match for me at kickboxing". (I.e. the line matches those characters exactly.)

tweet_match <- "A computer once beat me at chess, but it was no match for me at kickboxing"
match_tweets <- subset(twitter, grepl(tweet_match, twitter))
print(length(match_tweets))


