#
# Plot4.R is an exercise of Coursera Exploratory Data Analysis Course (exercise 4)
#
# This pogram loads the data from its parent directory. Data comes from 
# electric power consumption provided by UC Irvine
#

# Reading the complete data file
Data <- read.table("../household_power_consumption.txt", header = TRUE, sep=";",
                   na.strings="?",stringsAsFactors = FALSE)

# Converting Date format
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")

# subsetting the data of interest and removing the rest of data
usefulData <- subset(Data, (Data$Date >= "2007-02-01" & Data$Date <= "2007-02-02"))
rm(Data)

daytime <- paste(as.Date(usefulData$Date), usefulData$Time)
usefulData$Tindex <- as.POSIXct(daytime)
                   
                 

# Reproduction of plot 4 in display
par(mfrow = c(2,2), bg = "white")
plot(usefulData$Tindex,usefulData$Global_active_power,type = "l",
     xlab = "", ylab = "Global Active Power")
plot(usefulData$Tindex,usefulData$Voltage,type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(usefulData$Tindex, usefulData$Sub_metering_1,type = "l", main = "", 
         ylab = "Energy sub metering", xlab ="")
lines(usefulData$Tindex, usefulData$Sub_metering_2, col = "red")
lines(usefulData$Tindex, usefulData$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1, col = c("black","red","blue"), box.lty = 0)
plot(usefulData$Tindex,usefulData$Global_reactive_power,type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

# copying plot 4 into png file 
dev.copy(png, file = "plot4.png", height = 400, width = 480)
dev.off()