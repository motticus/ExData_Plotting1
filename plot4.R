plot4 <- function() {
  file <- "household_power_consumption.txt"
  electric <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  elec <- electric[electric$Date %in% c("1/2/2007","2/2/2007") ,] 
  elec$Global_active_power <- as.numeric(as.character(elec$Global_active_power))
  elec$Sub_metering_1 <- as.numeric(as.character(elec$Sub_metering_1))
  elec$Sub_metering_2 <- as.numeric(as.character(elec$Sub_metering_2))
  elec$Sub_metering_3 <- as.numeric(as.character(elec$Sub_metering_3))
  elec$Voltage <- as.numeric(as.character(elec$Voltage))
  elec$Datetime <- strptime(paste(elec$Date, elec$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  rm(electric)
  png(file="plot4.png",width=480,height=480, res=60)
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  plot(elec$Datetime, elec$Global_active_power, type="l", 
         ylab="Global Active Power", xlab="")
  plot(elec$Datetime, elec$Voltage, type="l", 
         ylab="Voltage", xlab="datetime")
  plot(elec$Datetime, elec$Sub_metering_1, type="l", 
         ylab="Energy sub metering", xlab="")
  lines(elec$Datetime,elec$Sub_metering_2,col='Red')
  lines(elec$Datetime,elec$Sub_metering_3,col='Blue')
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1), xjust=1, yjust=1, col=c("black", "red", "blue"))
  plot(elec$Datetime, elec$Global_reactive_power, type="l", 
         ylab="Global_reactive_power",xlab="datetime")
  
  dev.off()
}