## Reading the desired part of the big text file

data <- read.csv.sql("household_power_consumption.txt", 
                     header = T, sep=";", 
                     sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

## Converting and merging the Date and Time columns into the right time format
dataDate<- strptime( paste (data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Changing the device to png and creating plot2 as a png file in the working directory
png(file = "./plot2.png", width = 480, height = 480, units = "px")
plot(dataDate, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()