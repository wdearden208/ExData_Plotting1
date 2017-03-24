source('get_power_data.R')
power <- get_power_data()

##Download file and save to table
download.file(url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile='power.zip')
unzip('power.zip')
power <- read.table('household_power_consumption.txt', header=TRUE, sep=';')

##Subset by date and convert to kilowatts
power %<>% unite(Datetime, Date, Time, sep=' ')
power$Datetime %<>% dmy_hms
range <- interval(ymd(20070201), ymd(20070202))
power <- power[power$Datetime %within% range,]
power$Global_active_power %<>% as.numeric %>% divide_by(1000)

##Generate plot
hist(power$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
