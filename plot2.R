plot2 <- function () {
    ## read data
    data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
    ## filter 2007-02-01 and 2007-02-02
    gddates <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
    data <- data[gddates,]
    

    ## Add date information to Time and convert it
    data$Time <- paste(data$Date, data$Time)
    data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S")
    
    ## make plot
    png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 11)
    plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global active power (kilowatts)", main = "Global active power")
    dev.off()
}