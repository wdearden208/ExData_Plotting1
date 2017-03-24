#Run download and clean script and get cleaned power data
source('get_power_data.R')
power <- get_power_data()

##Generate plot
plot(power$Datetime, power$Global_active_power, type='l',
     xlab="", ylab="Global active power (kilowatts)")

##Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
