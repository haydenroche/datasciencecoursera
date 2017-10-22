library(tidyverse)
library(lubridate)
library(nycflights13)
##16.2.4 Exercises

## 1.	You get a warning message that reads “1 failed to parse”. It produces an NA
## 2.	Tzone: it’s a character vector that specifies the time zone of the current date equation you are performing. It will default to the time zone of your computer
## 3.	Parse each of the following dates:
##    a.	mdy(d1)
##    b.	ymd(d2)
##    c.	dmy(d3)
##    d.	mdy(d4)
##    e.	mdy(d5)


##16.3.4 Exercises
## 1.	How does the distribution of flight times within a day change over the course of the year?
flights_dt %>%
  mutate(time = hour(dep_time) * 100 + minute(dep_time),
         mon = as.factor(month(dep_time))) %>%
  ggplot(aes(x=time, group = mon, color = mon)) +
  geom_freqpoly(binwidth = 100)

## 2. Compare dep_time, sched_dep_time and dep_delay. Are they consistent? Explain your findings.
flights_dt %>%
  select(dep_time, sched_dep_time, dep_delay) %>%
  mutate(test_dep = sched_dep_time + (dep_delay*60)) %>%
  filter(test_dep != dep_time)
  ##It looks to me that there is breakage when the a delay is so long that the actual deparate day is a day after the schedule deparate date

## 3. Compare air_time with the duration between the departure and arrival. Explain your findings. (Hint: consider the location of the airport.)
View(flights_dt %>%
  mutate(adjusted_time = as.numeric(arr_time - dep_time),
         differ = adjusted_time - air_time) %>%
  select(origin, dest, differ))
  ##The greatest difference in airtime and the duration between deparature and arrival is when the origin and destination are incredibly far away. For example Honolulu, HI and Newark, NJ

## 4. How does the average delay time change over the course of a day? Should you use dep_time or sched_dep_time? Why?
  ##Sched_dep_time is more effective because if we use dep_time there will be a plethora of unknown factors delaying flights and muddying the data
flights_dt %>%
  mutate(flight_hour = hour(sched_dep_time)) %>%
  group_by(flight_hour) %>%
  summarise(avg_delay = mean(dep_delay)) %>%
  ggplot(aes(y = avg_delay, x = flight_hour)) +
  geom_point() +
  geom_smooth()

## 5. On what day of the week should you leave if you want to minimise the chance of a delay?
View(flights_dt %>%
  mutate(DoW = wday(sched_dep_time, label = TRUE)) %>%
  group_by(DoW) %>%
  summarise(avg_ddelay = mean(dep_delay),
            avr_adelay = mean(arr_delay, na.rm = TRUE))) 
  ##Saturdays have the lowest average departure and average arrival 

## 6. What makes the distribution of diamonds$carat and flights$sched_dep_time similar?
  ##Both distributions are in even integers that are easily countable. Very minimal decimal points that make the data points easy to read

## 7. Confirm my hypothesis that the early departures of flights in minutes 20-30 and 50-60 are caused by scheduled flights that leave early. Hint: create a binary variable that tells you whether or not a flight was delayed.
flights_dt %>%
  mutate(early = dep_delay < 0,
         minute = minute(sched_dep_time)) %>%
  group_by(minute) %>%
  summarise(early = mean(early)) %>%
  ggplot(aes(x = minute, y = early)) +
  geom_point()
  ##It doesn't look like there's any correlation to validate the hypothesis. There is no noticable trend in the data to interpret.

##16.4.5 Exercises
## 1. Why is there months() but no dmonths()?
  ##You can't create a months interval because there's not always an even translation between months and seconds. Each month is of variable lengths.

## 2. Explain days(overnight * 1) to someone who has just started learning R. How does it work?
  ##Overnight is binary so it's either TRUE(1) or FALSE(0). If it's overnight then the value returned is 1.

## 3. Create a vector of dates giving the first day of every month in 2015. Create a vector of dates giving the first day of every month in the current year.
ymd("2015-01-01") + months(0:11)
floor_date(today(), unit = "year") + months(0:11)

## 4. Write a function that given your birthday (as a date), returns how old you are in years.
Hayden_age <- today() - ymd(19940806)
as.duration(Hayden_age)

## 5. Why can’t (today() %--% (today() + years(1)) / months(1) work?
  ##This function doesn't seem to make sense because it's telling R to go to a date that is one year from today and then divide by month.




