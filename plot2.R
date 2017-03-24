#Run download and clean script and get cleaned power data
source('get_power_data.R')
power <- get_power_data()

##Generate plot
png("plot2.png", width=480, height=480)
plot(power$Datetime, power$Global_active_power, type='l',
     xlab="", ylab="Global active power (kilowatts)")

##Save to file
dev.off()
