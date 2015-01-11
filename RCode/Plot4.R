plot4 <- function()
{
  ##Read in all the data
  powerData <- read.csv("household_power_consumption.txt", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = c("?"), sep=";")
  
  ##Take the sub-data for the specified dates.
  subPowerData <- powerData[powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007",]
  
  ##Create a new DateTime column to use for creating plot time. 
  subDat$DateTime <- as.POSIXct(paste(subDat$Date, subDat$Time), format="%d/%m/%Y %H:%M:%S") 
  
  par(mfrow=c(2,2))
  
  ##Plot1
  p1<-plot(subDat$DateTime, subDat$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

  ##Plot2
  p2<-plot(subDat$DateTime, subDat$Voltage, type="l", ylab="Voltage", xlab="")

  ##Plot3
  p3<-plot(subDat$DateTime, subDat$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(subDat$DateTime, subDat$Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", col="red")
  lines(subDat$DateTime, subDat$Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", col="blue")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c('black', 'red', 'blue'), lty=1, bty='y', cex=.75, border=1 )
  
  ##Plot4
  p4<-plot(subDat$DateTime, subDat$Global_reactive_power, type="l", ylab="Global Reactive Power (kilowatts)", xlab="")

  with(subDat, p1, p2, p3, p4,par(mfrow=c(2,2)))
  
  dev.copy(png,file="Plot4.png", width=480, height=480)
  dev.off()
}