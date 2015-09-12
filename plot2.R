
#Reading the Data 
data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')


#Creating DateTime .
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


data$Date <- as.Date(data$Date , "%d/%m/%Y")


#Subsetting the Data 
data <- subset(data , data$Date  >= as.Date("2007-02-01") & 
                 data$Date <= as.Date("2007-02-02"))



png(filename='plot2.png', height=480, width=480)

# Creating the plot
plot(data$DateTime, data$Global_active_power, ylab='Global Active Power (kilowatts)',  type='l' , xlab='')
axis(1, at=1:length(data$DateTime), labels=weekdays(as.Date(data$DateTime) , abbreviate = T) )

dev.off()
