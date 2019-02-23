

plot1 <- function(x){
  
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
  png(file="plot1.png")
  with(hpc, hist(Global_active_power, main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)", col = "red"))
  dev.off()
}


