generatePlot_3 <- function(){
    rm(list = ls())
    dev.off(dev.list()["RStudioGD"])
    data <- read.table("household_power_consumption.txt", sep = ";",na.strings = "?", header = TRUE)
    subData <- subset(data, as.Date(data$Date, format = "%d/%m/%Y")>= "2007-02-01" & as.Date(data$Date, format = "%d/%m/%Y") <= "2007-02-02" )
    subData$Date<-as.Date(subData$Date,format = "%d/%m/%Y")
    subData$dateTime <- as.POSIXct(paste(subData$Date, subData$Time, format= "%Y-%m-%d %H:%M:%S"))
    plot(subData$dateTime, subData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(subData$dateTime, subData$Sub_metering_2, col = "red", type = "l")
    lines(subData$dateTime, subData$Sub_metering_3, col = "blue", type = "l")
    legend("topright", col = c("black","red","blue"), lty = 1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.copy(png, file = "plot3.png", width = 480,height = 480, units = "px")
    dev.off()
}