# Read raw data into working memory
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Select only data for 2/1/2007 and 2/2/2007
Subset <- Data[as.Date(Data$Date, format = "%d/%m/%Y") %in%  as.Date(c('2007-02-01','2007-02-02')), ]

# Create new datetime column
Subset$datetime <- paste(Subset$Date, Subset$Time)
Subset$datetime <- strptime(Subset$datetime, format = "%d/%m/%Y %H:%M:%S")

# Create plot2.png
png("plot2.png", width = 480, height = 480)
plot(Subset$datetime, Subset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
