#This program assumes that you have downloaded the data from 
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#and have unzipped the file and placed the file household_power_consumption.txt
#in the working directory.
plot1 <- function() {
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
    hist(selData$Global_active_power, 
         xlab = "Global Active Power (kilowatts)", 
         main = "Global Active Power", 
         col="red")
    dev.copy(png,'plot1.png')
    dev.off()
}
