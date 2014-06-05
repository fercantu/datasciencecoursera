##
## PLOT 3
##
## Read the data and subset the data for the two-day period required for this exercise
## Note that the setwd() command has to be changed to point to the folder where the data
## is located.
##
setwd("C:/Users/11923/Documents/data")
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")
data2 <- data
data2 <- cbind(data, strptime(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S"))
colnames(data2)[dim(data2)[2]] <- "DateC"
data2[,1] <- as.Date(data[,1], format="%d/%m/%Y")
subdata <- data2[data2$Date == "2007-02-01" | data2$Date == "2007-02-02",]
##
## Create plot3 and save it as a .png file
##
png(filename = "plot3.png", width = 480, height = 480)
plot(subdata$DateC, subdata$Sub_metering_1, type="n", xlab="", 
     ylab = "Energy sub metering")
lines(subdata$DateC, subdata$Sub_metering_1)
lines(subdata$DateC, subdata$Sub_metering_2, col = "red")
lines(subdata$DateC, subdata$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, col=c("black","red","blue"))
dev.off()