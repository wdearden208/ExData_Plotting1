#Run download and clean script and get cleaned power data
source('get_power_data.R')
power <- get_power_data()

png("plot3.png", width=480, height=480)
plot(power$Datetime, power$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(power$Datetime, power$Sub_metering_2, type="l", col="red")
lines(power$Datetime, power$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
