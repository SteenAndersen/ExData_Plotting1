
setwd("~/R/ExData_Plotting1")
# Read the data file
housing <- read.csv("household_power_consumption.txt", header = T, sep=";",stringsAsFactors = F)

# Convert the date column from string representation to a date object
housing$Date <- as.Date(housing$Date  , "%d/%m/%Y")

# Trim the data set to only include dates from "01/02/2007" to "02/02/2007"
housingTrimmed1 <- housing[(housing$Date >= as.Date("01/02/2007", "%d/%m/%Y")) & (housing$Date <= as.Date("02/02/2007", "%d/%m/%Y")) ,]

# Convert the column Global_active_power to numeric
housingTrimmed1$Global_active_power <- as.numeric(housingTrimmed1$Global_active_power)

# Open a png file for storing the plot
png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

# Plot the histogram
hist(housingTrimmed1$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

# Close the device
dev.off()
