#Run download and clean script and get cleaned power data
source('get_power_data.R')
power <- get_power_data()

##Create plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(power$Datetime, power$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(power$Datetime, power$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(power$Datetime, power$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(power$Datetime, power$Sub_metering_2, type="l", col="red")
lines(power$Datetime, power$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")
plot(power$Datetime, power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
