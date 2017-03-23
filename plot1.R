require(data.table)
require(magrittr)
require(lubridate)

download.file(url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile='power.zip')
unzip('power.zip')
power <- read.table('household_power_consumption.txt', header=TRUE, sep=';')
power$Date %<>% dmy
range <- interval(ymd(20070201), ymd(20070202))
power <- power[power$Date %within% range,]
power$Global_active_power %<>% as.numeric %>% divide_by(1000)
hist(power$Global_active_power[power$Global_active_power<=4],
     xlab='Global Active Power (kilowatts)',
     breaks=seq(0,6,0.5))
