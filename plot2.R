plot2 <- function() {
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
    
    selData <- data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02") ,]

    plot(selData[,2:3], type="n", ann=FALSE)
    title( ylab = "Global Active Power (kilowatts)")
    lines(selData[,2:3])
    
    dev.copy(png,'plot2.png')
    dev.off()
}
