plot3 <- function () {
    ## read data
    data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
    ## filter 2007-02-01 and 2007-02-02
    gddates <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
    data <- data[gddates,]
    
    
    ## Add date information to Time and convert it
    data$Time <- paste(data$Date, data$Time)
    data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S")
    
    ## make plot
    png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 11)
    with(data, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
    with(data, lines(Time, Sub_metering_2, type="l", col = "red"))
    with(data, lines(Time, Sub_metering_3, type="l", col = "blue"))
    legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.off()
}