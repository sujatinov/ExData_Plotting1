data = read.csv("household_power_consumption.txt", sep=";", na.strings = c("?"))

data$Date = as.Date(data$Date, format="%d/%m/%Y")
data$Time = strptime(paste(as.character(data$Date), data$Time), format="%Y-%m-%d %H:%M:%S")

data = subset(data, Date %in% c(as.Date("2007-02-01", format="%Y-%m-%d"), as.Date("2007-02-02", format="%Y-%m-%d")))

png("plot3.png", width = 480, height = 480, units = "px")

with(data, {
    plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering")
    
    lines(Time, Sub_metering_1, type="l")
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
    
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)
})

dev.off()
