#Run download and clean script and get cleaned power data
source('get_power_data.R')
power <- get_power_data()

##Generate plot
hist(power$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
