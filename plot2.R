plot2 <- function() {
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
  png(file="plot2.png",width=480,height=480, res=60)
  plot(elec$Datetime,elec$Global_active_power, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
}