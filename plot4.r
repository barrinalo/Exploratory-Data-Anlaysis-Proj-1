plot4 <- function() {
  data <- read.table("household_power_consumption.txt", header=T, as.is=T,sep=";",na.strings="?")
  data2 <- rbind(data[data$Date == "1/2/2007",],data[data$Date == "2/2/2007",])
  data3 <- cbind(paste(data2$Date,data2$Time), data2[,3:9])
  data3[[1]] <- as.character(data3[[1]])
  data3[[1]] <- strptime(data3[[1]], format="%d/%m/%Y %H:%M:%S")
  names(data3)[1] <- "DateTime"
  png("plot4.png")
  par(mfrow=c(2,2))
  with(data3, {
    plot(DateTime,Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
    plot(DateTime,Voltage,type="l",ylab="Voltage",xlab="datetime")
    plot(data3$DateTime,data3$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
    lines(data3$DateTime,data3$Sub_metering_2,col="red")
    lines(data3$DateTime,data3$Sub_metering_3,col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
    plot(DateTime,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
    })
  dev.off()
}