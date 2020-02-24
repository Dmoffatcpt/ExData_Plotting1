#Create table from raw data
rawdata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
#Change Dates from factor into Date class
rawdata$Date <- as.Date(rawdata$Date, format("%d/%m/%Y") )
#Subset dates based upon those dates required.
data2007 <- subset(rawdata, rawdata$Date >= "2007-02-01" & rawdata$Date <= "2007-02-02")
#Create Date/Time object for plotting
DateTime <- paste(data2007$Date, data2007$Time)
DateTime <- strptime(DateTime, "%Y-%m-%d %H:%M:%S")
#Create plot
plot(DateTime,as.numeric(as.character(data2007$Sub_metering_1)),ylab= "Energy sub metering", xlab = "", type ="l")
points(DateTime,as.numeric(as.character(data2007$Sub_metering_2)), col = "red", type = "l")
points(DateTime,as.numeric(as.character(data2007$Sub_metering_3)), col = "blue", type = "l")
legend("topright",lty = 1,col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#create PNG file
dev.copy(png,file="Plot3.png", width = 480, height = 480)
dev.off()