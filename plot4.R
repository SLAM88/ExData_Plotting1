# Read raw data into working memory
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Select only data for 2/1/2007 and 2/2/2007
Subset <- Data[as.Date(Data$Date, format = "%d/%m/%Y") %in%  as.Date(c('2007-02-01','2007-02-02')), ]

# Create new datetime column
Subset$datetime <- paste(Subset$Date, Subset$Time)
Subset$datetime <- strptime(Subset$datetime, format = "%d/%m/%Y %H:%M:%S")

# Create plot4.png
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(Subset$datetime, Subset$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(Subset$datetime, Subset$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(Subset$datetime, Subset$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(Subset$datetime, Subset$Sub_metering_2, col = "red")
lines(Subset$datetime, Subset$Sub_metering_3, col = "blue")
legend(x = "topright", col = c("black", "blue", "red"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Subset$datetime, Subset$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
