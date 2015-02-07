#store langugage settings
user_lang <- Sys.getlocale("LC_TIME")
#set language to English (to properly display days of the week)
Sys.setlocale("LC_TIME", "English")

#read data
data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")

#subset
data <- data[data$Date=="1/2/2007" | data$Date == "2/2/2007", ]

#convert the Date and Time variables to Date/Time classes
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#png as graphic device
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

#plots
par(mfrow=c(2,2))

plot(x = data$Time, y = data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

plot(x = data$Time, y = data$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

plot(x = data$Time, y = data$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", col="black")
#lines
lines(x = data$Time, y = data$Sub_metering_2, col="red", type="l");
lines(x = data$Time, y = data$Sub_metering_3, col="blue", type="l");
#legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty=c(1,1), bty="n")

plot(x = data$Time, y = data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

#close the graphic device
dev.off()

#restore language
Sys.setlocale("LC_TIME", user_lang)