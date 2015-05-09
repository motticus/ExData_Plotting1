exdata_hw1 <- function() {
  file <- "household_power_consumption.txt"
  electric <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  #electric$Date <- as.Date(electric$Date, "%d/%m/%Y")
  elec <- electric[electric$Date %in% c("1/2/2007","2/2/2007") ,] 
  elec$Global_active_power <- as.numeric(as.character(elec$Global_active_power))
  elec$Sub_metering_1 <- as.numeric(as.character(elec$Sub_metering_1))
  elec$Sub_metering_2 <- as.numeric(as.character(elec$Sub_metering_2))
  elec$Sub_metering_3 <- as.numeric(as.character(elec$Sub_metering_3))
  elec$Voltage <- as.numeric(as.character(elec$Voltage))
  elec$Datetime <- strptime(paste(elec$Date, elec$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  rm(electric)
  #elec <- transform(elec, timestamp=as.POSIXct(paste(elec$Date, elec$Time)), "%d/%m/%Y %H:%M:%S")
  ## Plot 4
  png(file="plot4.png",width=480,height=480, res=60)
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(elec, {
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
  })
  

  dev.off()
}

plot1 <- function() {
  hist(elec$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("Plot1.png has been saved in", getwd())
}

plot2 <- function() {
  plot(elec$Datetime,elec$Global_active_power, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  dev.copy(png, file="plot2.png", height=480, width=480)
  dev.off()
}

plot3 <- function() {
  plot(elec$Datetime, elec$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
  lines(elec$Datetime, elec$Sub_metering_2, type="l", col="red")
  lines(elec$Datetime, elec$Sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()
}

plot4 <- function() {
  
}
