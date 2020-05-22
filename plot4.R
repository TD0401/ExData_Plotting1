plotMatrixGraph <- function(){
    #creating data directory if not present already 
    if(!file.exists("data")){
        dir.create("data")
    }
    
    #downloading zip file if not already present
    if(!file.exists("data/PlotData.zip")){
        fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileurl ,"data/PlotData.zip", method = "curl")
    }
    
    #unzipping if not present already
    if(!file.exists("data/PlotData/household_power_consumption.txt")){
        unzip("data/PlotData.zip",exdir ="data/PlotData")
    }
    
    #reading only rows that of 2007-02-01 and 2007-02-02 as per assignment pointers. However the data file has
    # date mentioned in dd/mm/yyyy format so given accordingly.
    library(sqldf)
    powerData <- read.csv.sql("data/PlotData/household_power_consumption.txt" , sep=";" ,
                              sql = "Select * from file where Date = '1/2/2007' OR Date = '2/2/2007' ")
    
    
    #Setting Graphic Device as png file with mentioned height and width
    png(file="plot4.png" , width = 480 , height = 480)
    
    #plotting the historgram with the desired attributes
    datetime_vect <- strptime( paste(powerData$Date , powerData$Time) , "%d/%m/%Y %H:%M:%S")
    par(mfrow = c(2,2) , mar = c(4,4,2,2))
    plot(x= datetime_vect,  y = powerData$Global_active_power, type="l", xlab="" , ylab = "Global Active Power")
    plot(x= datetime_vect,  y = powerData$Voltage, type="l", xlab="datetime" , ylab = "Voltage")
   
     plot(x= datetime_vect,  y = powerData$Sub_metering_1, type="n", xlab="" , ylab = "Energy sub metering")
    lines(datetime_vect, powerData$Sub_metering_1,type="l" )
    lines(datetime_vect, powerData$Sub_metering_2,type="l",col="red")
    lines(datetime_vect, powerData$Sub_metering_3,type="l",col="blue")
    
    legend("topright" ,lty=c(1,1,1) , col =c("black","red","blue") , legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , bty="n")
    
    plot(x= datetime_vect,  y = powerData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power" )
    #Closing the graphic device
    dev.off()
    
}