plot2 <- function()
{
  ##Read in all the data
  powerData <- read.csv("household_power_consumption.txt", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = c("?"), sep=";")
  
  ##Take the sub-data for the specified dates.
  subPowerData <- powerData[powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007",]
  
  ##Create a new DateTime column to use for creating plot time. 
  subDat$DateTime <- as.POSIXct(paste(subDat$Date, subDat$Time), format="%d/%m/%Y %H:%M:%S") 
  
  with(subDat, plot(subDat$DateTime, subDat$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
  dev.copy(png,file="Plot2.png", width=480, height=480)
  dev.off()

}

  