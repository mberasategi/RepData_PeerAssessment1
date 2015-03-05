
# 1. Create a new factor variable in the dataset with two levels -- "weekday" and "weekend" indicating whether a given date is a weekday or weekend day.

dayType <- function(x) {
  switch(x,
         'lunes'='weekday',
         'martes'='weekday',
         'miércoles'='weekday',
         'jueves'='weekday',
         'viernes'='weekday',
         'sábado'='weekend',
         'domingo'='weekend')
}
activityFilled$weekend = sapply(weekdays(activity$date), dayType)

# 2. Make a panel plot containing a time series plot (i.e. `type = "l"`) of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis). The plot should look something like the following, which was created using **simulated data**:
  

activityFilledDailyMean <- aggregate(activityFilled$steps, by = list(interval=activityFilled$interval, weekend=activityFilled$weekend), mean)

ggplot(activityFilledDailyMean, aes(interval,x) ) +
  geom_line(colour="#333333", size = 1.1) +
  facet_grid(weekend ~ .)