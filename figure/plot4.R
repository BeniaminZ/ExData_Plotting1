## Reading the desired part of the big text file

data <- read.csv.sql("household_power_consumption.txt", 
                     header = T, sep=";", 
                     sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

## Converting and merging the Date and Time columns into the right time format
dataDate<- strptime( paste (data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Changing the device to png and creating plot4 as a png file in the working directory
png(file = "./plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(dataDate, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")
plot(dataDate, data$Voltage, xlab="datetime", ylab="Voltage",type="l")
plot(dataDate, data[,7],"n", xlab="", ylab="Energy sub metering")
lines(dataDate, data$Sub_metering_1)
lines(dataDate, data$Sub_metering_2,col="red")  
lines(dataDate, data$Sub_metering_3, col="blue") 
legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd = .75, 
       cex = .75
)
plot(dataDate, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()