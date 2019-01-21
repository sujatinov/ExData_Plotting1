data = read.csv("household_power_consumption.txt", sep=";", na.strings = c("?"))

data$Date = as.Date(data$Date, format="%d/%m/%Y")
data = subset(data, Date %in% c(as.Date("2007-02-01", format="%Y-%m-%d"), as.Date("2007-02-02", format="%Y-%m-%d")))

png("plot1.png", width = 480, height = 480, units = "px")

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()
