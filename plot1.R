# Read raw data into working memory
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Select only data for 2/1/2007 and 2/2/2007
Subset <- Data[as.Date(Data$Date, format = "%d/%m/%Y") %in%  as.Date(c('2007-02-01','2007-02-02')), ]

# Create new datetime column
Subset$datetime <- paste(Subset$Date, Subset$Time)
Subset$datetime <- strptime(Subset$datetime, format = "%d/%m/%Y %H:%M:%S")

# Create plot1.png
png("plot1.png", width = 480, height = 480)
hist(Subset$Global_active_power, main = "Global Active Power", ylim = c(0, 1200), col = "red2", xlab = "Global Active Power (kilowatts)")
dev.off()
