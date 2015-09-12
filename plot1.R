

#Reading the data

data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')

# Creating DateTime 
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date , "%d/%m/%Y")

# Subsetting the Data 
data <- subset(data, data$Date >= as.Date("2007-02-01") & 
                 data$Date <= as.Date("2007-02-02"))

#Creating the hist.

png("plot1.png", height=480, width=480)

hist(data$Global_active_power, col='red', main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')



dev.off()

