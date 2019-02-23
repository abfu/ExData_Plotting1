plot4 <- function(x){
  
  ## Read the file and select relevant rows
  hpc <- read.delim("household_power_consumption.txt", sep=";", na.strings = "?")
  hpc_1 <- filter(hpc, Date == "1/2/2007")
  hpc_2 <- filter(hpc, Date ==  "2/2/2007")
  hpc <- rbind(hpc_1, hpc_2)
  
  ## Create datetime column as class "Date"
  hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  datetime <- paste(as.character(hpc$Date), as.character(hpc$Time))
  datetime <- strptime(datetime, c("%Y-%m-%d%T"))
  hpc <- cbind(hpc, datetime)
  
  ## Save plot to png file
  png(file="plot4.png")
  par(mfrow = c(2,2), oma = c(1,1,1,1))
  with(hpc, plot(datetime, Global_active_power, type = "l", ylab="Global Active Power", xlab=""))
  with(hpc, plot(datetime, Voltage, type ="l"))
  
  with(hpc, plot(datetime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab=""),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  with(hpc, lines(datetime, Sub_metering_2, col = "red"))
  with(hpc, lines(datetime, Sub_metering_3, col = "blue"))
  legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  with(hpc, plot(datetime, Global_reactive_power, type="l"))  
  dev.off()
}