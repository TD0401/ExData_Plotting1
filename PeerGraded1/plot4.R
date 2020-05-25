plotMatrixGraph <- function(){
   source("loadData.R")
    loadData()
    #Setting Graphic Device as png file with mentioned height and width
    png(file="plot4.png" , width = 480 , height = 480)
    
    #plotting the multiple plots in a 2 x 2 matrix with the desired attributes
    datetime_vect <- strptime( paste(powerData$Date , powerData$Time) , "%d/%m/%Y %H:%M:%S")
    par(mfrow = c(2,2) , mar = c(4,4,2,2))
    plot(x= datetime_vect,  y = powerData$Global_active_power, type="l", xlab="" , ylab = "Global Active Power")
    plot(x= datetime_vect,  y = powerData$Voltage, type="l", xlab="datetime" , ylab = "Voltage")
   
     plot(x= datetime_vect,  y = powerData$Sub_metering_1, type="l", xlab="" , ylab = "Energy sub metering")
    lines(datetime_vect, powerData$Sub_metering_2,type="l",col="red")
    lines(datetime_vect, powerData$Sub_metering_3,type="l",col="blue")
    
    legend("topright" ,lty=c(1,1,1) , col =c("black","red","blue") , legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , bty="n")
    
    plot(x= datetime_vect,  y = powerData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power" )
    #Closing the graphic device
    dev.off()
    
}