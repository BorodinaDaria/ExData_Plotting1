fn = "household_power_consumption.txt"
full_data <- read.table(fn, header = TRUE, sep = ";", na.strings = "?")
data <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dateTime <- as.POSIXlt(paste(data$Date, data$Time, sep=" "))

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(dateTime ,data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(dateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, data$Sub_metering_2, type="l", xlab="", ylab="", col="red")
lines(dateTime, data$Sub_metering_3, type="l", xlab="", ylab="", col="blue")
legend("topright", bty="n", pch="-", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
