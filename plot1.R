##read data
data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")

##subset
data <- data[data$Date=="1/2/2007" | data$Date == "2/2/2007", ]

# Choose png as graphic device
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

#plot histogram
hist(data$Global_active_power, 16, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close the graphic device
dev.off()