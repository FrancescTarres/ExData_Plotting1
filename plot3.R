#
# Plot3.R is an exercise of Coursera Exploratory Data Analysis Course (exercise 3)
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


# Reproduction of plot 3 in display
par(mfrow = c(1,1), bg = "white")

plot(usefulData$Tindex, usefulData$Sub_metering_1,type = "l", main = "", 
         ylab = "Energy sub metering", xlab ="")
lines(usefulData$Tindex, usefulData$Sub_metering_2, col = "red")
lines(usefulData$Tindex, usefulData$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1, col = c("black","red","blue"))

# copying plot 3 into png file 
dev.copy(png, file = "plot3.png", height = 400, width = 480, units = "px", pointsize = 10)
dev.off()