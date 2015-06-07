fn = "household_power_consumption.txt"
data_full <- read.table(fn, header = TRUE, sep = ";", na.strings = "?")
data <- subset(data_full, Date %in% c("1/2/2007", "2/2/2007"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dateTime <- as.POSIXlt(paste(data$Date, data$Time, sep=" "))

png("plot2.png", width=480, height=480)
plot(dateTime ,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
