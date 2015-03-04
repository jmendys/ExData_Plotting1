plot4 <- function() {
    #Set English locale so X axis is displayed in English
    Sys.setlocale("LC_TIME", "English")
    ## Read data
    data <- read.csv(file="household_power_consumption.txt", 
                     sep=";", 
                     na.strings="?",
                     colClasses = c("character","character",
                                    "numeric","numeric","numeric",
                                    "numeric","numeric","numeric","numeric")) 
    
    data[,2]<- as.POSIXct(strptime(paste(data[,1] ,data[,2]), format="%d/%m/%Y %H:%M:%S"))
    data[,1]<- as.Date(data[,1],format="%d/%m/%Y")
    
    #filter data
    selData <- data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02") ,]

    #set the layout and increase the font size (to make the plot readable)
    par(mfrow = c(2,2), cex=0.55)
    
    #Plot 2
    plot(selData[,2:3], type="n", ann=FALSE)
    title( ylab = "Global Active Power (kilowatts)")
    lines(selData[,2:3])
    
    #Plot voltage
    plot(selData[,c(2,5)], type="n", ann=FALSE)
    title( ylab = "Voltage", xlab="datetime")
    lines(selData[,c(2,5)])
    
    #Plot 3
    plot(selData[,c(2,7)], type="n", ann=FALSE)
    title( ylab = "Energy sub metering")
    lines(selData[,c(2,7)], col="black")
    lines(selData[,c(2,8)], col="red")
    lines(selData[,c(2,9)], col="blue")
    
    legend("topright", 
           lty=1,
           legend=names(selData[,7:9]), 
           col=c("black","red","blue"),
           bty="n")

    #Plot global reactive power    
    plot(selData[,c(2,4)], type="n", ann=FALSE)
    title( ylab = "Global_reactive_power", xlab="datetime")
    lines(selData[,c(2,4)])
    
    #export plot to file
    dev.copy(png,'plot4.png')
    dev.off()
}