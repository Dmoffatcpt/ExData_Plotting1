#Create table from raw data
rawdata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
#Change Dates from factor into Date class
rawdata$Date <- as.Date(rawdata$Date, format("%d/%m/%Y") )
#Subset dates based upon those dates required.
data2007 <- subset(rawdata, rawdata$Date >= "2007-02-01" & rawdata$Date <= "2007-02-02")
#Create histogram
hist(as.numeric(as.character(data2007$Global_active_power)),col="red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")
#create PNG file
dev.copy(png,file="Plot1.png",width = 480, height = 480)
dev.off()