# intervalMean <- aggregate(activity$steps, by = list(activity$interval), mean, na.rm = T)
# dailyMean <- aggregate(activity$steps, by = list(activity$date), mean, na.rm = T)
# allDayMean <- mean(dailyMean$x, na.rm = T)
# # plot(intervalMean$x/allDayMean, type="l", xlab ="Interval", ylab = "Mean")
# qplot(intervalMean$x/allDayMean, y='dailyMean$x', geom='line')
# 
# 
# intervalMean[which(intervalMean$x == max(intervalMean$x)), ]


avgStepsPerInterval <- aggregate(x=list(meanSteps=activity$steps), by=list(interval=activity$interval), FUN=mean, na.rm=TRUE)
ggplot(data=avgStepsPerInterval, aes(x=interval, y=meanSteps)) +
  geom_line(colour="#333333", size = 1.1) + 
  xlab("intervals") +
  ylab("avg. steps")

maxSteps <- avgStepsPerInterval[which(avgStepsPerInterval$meanSteps == max(avgStepsPerInterval$meanSteps)), ]
