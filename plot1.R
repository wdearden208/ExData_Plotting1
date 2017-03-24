#Run download and clean script and get cleaned power data
source('get_power_data.R')
power <- get_power_data()

##Generate plot
png("plot1.png", width=480, height=480)
hist(power$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Save to file
dev.off()
