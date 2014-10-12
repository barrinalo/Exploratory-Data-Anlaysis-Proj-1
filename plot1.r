plot1 <- function() {
  data <- read.table("household_power_consumption.txt", header=T, as.is=T,sep=";",na.strings="?")
  data2 <- rbind(data[data$Date == "1/2/2007",],data[data$Date == "2/2/2007",])
  gap <- as.numeric(data2$Global_active_power)
  png("plot1.png")
  hist(gap,xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red",main="Global Active Power")
  axis(2, at=seq(0,1200,by=200))
  dev.off()
}