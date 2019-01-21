data = read.csv("household_power_consumption.txt", sep=";", na.strings = c("?"))

data$Date = as.Date(data$Date, format="%d/%m/%Y")
data$Time = strptime(paste(as.character(data$Date), data$Time), format="%Y-%m-%d %H:%M:%S")

data = subset(data, Date %in% c(as.Date("2007-02-01", format="%Y-%m-%d"), as.Date("2007-02-02", format="%Y-%m-%d")))

png("plot2.png", width = 480, height = 480, units = "px")

with(data, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))

dev.off()
