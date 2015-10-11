
setwd("~/R/ExData_Plotting1")
# Read the data file
housing <- read.csv("household_power_consumption.txt", header = T, sep=";",stringsAsFactors = F)

# Convert the date column from string representation to a date object
housing$Date <- as.Date(housing$Date  , "%d/%m/%Y")

# Trim the data set to only include dates from "01/02/2007" to "02/02/2007"
housingTrimmed1 <- housing[(housing$Date >= as.Date("01/02/2007", "%d/%m/%Y")) & (housing$Date <= as.Date("02/02/2007", "%d/%m/%Y")) ,]

# Make a new column with both date and time in it
dt <- paste(as.Date(housingTrimmed1$Date), housingTrimmed1$Time)
housingTrimmed1$datetime <- as.POSIXct(dt)

# Open a png file for storing the plot
png(file = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

# Make the plot
plot(housingTrimmed1$Sub_metering_1 ~ housingTrimmed1$datetime, type = "l",  ylab = "Energy sub metering", xlab = "")
lines(housingTrimmed1$Sub_metering_2 ~ housingTrimmed1$datetime, col = 'red')
lines(housingTrimmed1$Sub_metering_3 ~ housingTrimmed1$datetime, col = 'blue')

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the device
dev.off()
