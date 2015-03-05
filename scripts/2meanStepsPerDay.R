library(ggplot2)
#stepsPerDay <- tapply(activity$steps, activity$date, FUN = sum)
stepsPerDay <- aggregate(activity$steps, by=list(Day = activity$date), FUN = sum, na.rm = T)
qplot(stepsPerDay$x, binwidth = 1000, xlab = "Total number of steps taken per day")

stepsMean <- mean(stepsPerDay$x, na.rm = T)
stepsMedian <- median(stepsPerDay$x, na.rm = T)