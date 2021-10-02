#setting up your working directory
setwd("C:/Users/Tong/Desktop/Intro to R/Sentiment analysis_github")

data <- read.csv(file.choose(), header = T) 
dim(data)
head(data)

#calling library
library(syuzhet)

comment <- iconv(data$Comment, to = 'utf-8')

#Sentiment score
s <- get_nrc_sentiment(comment)
head(s)

#Create neutral column
s$neutral <- ifelse(s$negative+s$positive==0, 1, 0)
head(s)
sum(s)
colSums(s)
100*colSums(s)/sum(s)
write.csv(s, "sentiment data.csv", row.names = F)

#See any comments
comment[3]
comment[12]

#See where it allocates these words
get_nrc_sentiment('beautiful')
get_nrc_sentiment('love') 


#Bar plot
barplot(100*colSums(s)/sum(s),
        las = 2,
        col = rainbow(11),
        ylab = 'Percentage',
        main = 'Sentiment Score from Watercolors Painting Demonstration')

