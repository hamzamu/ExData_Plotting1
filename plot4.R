


#reading the daya 

data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')

# creating DateTime Field 
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


data$Date <- as.Date(data$Date , "%d/%m/%Y")

#Subsetting the data 
data <- subset(data, data$Date >= as.Date("2007-02-01") & 
                 data$Date <= as.Date("2007-02-02"))


#Creating the plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Global_active_power
plot(data$DateTime, data$Global_active_power, ylab='Global Active Power (kilowatts)',  type='l' , xlab='')
axis(1, at=1:length(data$DateTime), labels=weekdays(as.Date(data$DateTime) , abbreviate = T) )

# Voltage
plot(data$DateTime, data$Voltage, ylab='Voltage',  type='l' , xlab='')
axis(1, at=1:length(data$DateTime), labels=weekdays(as.Date(data$DateTime) , abbreviate = T) )

#energy submetering .

plot(data$DateTime, data$Sub_metering_1  , type='l', xlab='', ylab='Energy sub metering' )
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')

axis(1, at=seq_along(data$DateTime), labels=weekdays(data$Date , abbreviate = T) )

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))



# Global_reactive_power
plot(data$DateTime, data$Global_reactive_power, ylab='Global_reactive_power',  type='l' , xlab='')
axis(1, at=1:length(data$DateTime), labels=weekdays(as.Date(data$DateTime) , abbreviate = T) )


#Closing the device
dev.off()

