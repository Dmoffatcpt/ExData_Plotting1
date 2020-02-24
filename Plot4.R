#Create table from raw data
rawdata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
#Change Dates from factor into Date class
rawdata$Date <- as.Date(rawdata$Date, format("%d/%m/%Y") )
#Subset dates based upon those dates required.
data2007 <- subset(rawdata, rawdata$Date >= "2007-02-01" & rawdata$Date <= "2007-02-02")
#Create Date/Time object for plotting
DateTime <- paste(data2007$Date, data2007$Time)
DateTime <- strptime(DateTime, "%Y-%m-%d %H:%M:%S")
#Create Plot layout
par(mfrow = c(2,2))

#Create plot top left
plot(DateTime,as.numeric(as.character(data2007$Global_active_power)),ylab= "Global Active Power", xlab = "", type ="l")

#Create plot top right
plot(DateTime,as.numeric(as.character(data2007$Voltage)),ylab= "Voltage", xlab = "datetime", type ="l")

#Create plot bottom left
plot(DateTime,as.numeric(as.character(data2007$Sub_metering_1)),ylab= "Energy sub metering", xlab = "", type ="l")
points(DateTime,as.numeric(as.character(data2007$Sub_metering_2)), col = "red", type = "l")
points(DateTime,as.numeric(as.character(data2007$Sub_metering_3)), col = "blue", type = "l")
legend("topright",lty = 1,col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Create plot bottom right
plot(DateTime,as.numeric(as.character(data2007$Global_reactive_power)),ylab= "Global_reactive_power", xlab = "datetime", type ="l")

#create PNG file
dev.copy(png,file="Plot4.png", width = 480, height = 480)
dev.off()