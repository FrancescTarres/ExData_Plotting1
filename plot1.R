#
# Plot1.R is an exercise of Coursera Exploratory Data Analysis Course
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

# Reproduction of plot 1 in display
par(mfrow = c(1,1), bg = "white")
hist(usefulData$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# copying plot 1 into png file 
dev.copy(png, file = "plot1.png", height = 400, width = 480)
dev.off()