plot1 <- function () {
    ## read data
    data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
    ## filter 2007-02-01 and 2007-02-02
    gddates <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
    data <- data[gddates,]
    
    ## plot histogram
    png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 11)
    hist(data$Global_active_power, xlab = "Global active power (kilowatts)", col = "red", main = "Global active power")
    dev.off()
}