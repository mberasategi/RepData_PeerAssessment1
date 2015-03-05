activity <- read.csv('data/activity.csv')

# recognize date
activity$date <- as.Date(activity$date)

# load required libraries
library(ggplot2)