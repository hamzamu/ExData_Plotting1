

#Reading the Data
data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date , "%d/%m/%Y")


#Subsetting the day=ta
data <- subset(data , data$Date  >= as.Date("2007-02-01") & 
                 data$Date <= as.Date("2007-02-02"))



#Creatintg the plot and writing it to png file .
png(filename='plot3.png' , height=480, width=480)



plot(data$DateTime, data$Sub_metering_1  , type='l', xlab='', ylab='Energy sub metering' )
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')

axis(1, at=seq_along(data$DateTime), labels=weekdays(data$Date , abbreviate = T) )

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))


dev.off()
