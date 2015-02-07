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
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

#plot
plot(x = data$Time, y = data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

#close the graphic device
dev.off()

#restore language
Sys.setlocale("LC_TIME", user_lang)