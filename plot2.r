plot2 <- function() {
  data <- read.table("household_power_consumption.txt", header=T, as.is=T,sep=";",na.strings="?")
  data2 <- rbind(data[data$Date == "1/2/2007",],data[data$Date == "2/2/2007",])
  data3 <- cbind(paste(data2$Date,data2$Time), data2[,3:9])
  data3[[1]] <- as.character(data3[[1]])
  data3[[1]] <- strptime(data3[[1]], format="%d/%m/%Y %H:%M:%S")
  names(data3)[1] <- "DateTime"
  png("plot2.png")
  plot(data3$DateTime,data3$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
  box()
  dev.off()
}