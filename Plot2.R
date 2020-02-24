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
plot(DateTime,as.numeric(as.character(data2007$Global_active_power)),ylab= "Global Active Power (kilowatts)", xlab = "", type ="l")
#create PNG file
dev.copy(png,file="Plot2.png", width = 480, height = 480)
dev.off()