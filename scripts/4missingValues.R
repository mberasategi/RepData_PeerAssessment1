naValues <- length(which(is.na(activity$steps)))

temp <- merge(activity, avgStepsPerInterval, by ="interval")
temp$steps <- ifelse(is.na(temp$steps), temp$meanSteps, temp$steps)
activityFilled <- temp[,1:4]

stepsPerDayFilled <- aggregate(activityFilled$steps, by=list(Day = activityFilled$date), FUN = sum, na.rm = T)
qplot(stepsPerDayFilled$x, binwidth = 1000, xlab = "Total number of steps taken per day (with missing values filled)")