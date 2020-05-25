plotMultiLineGraph <- function(){
    source("loadData.R")
    loadData()
    #Setting Graphic Device as png file with mentioned height and width
    png(file="plot3.png" , width = 480 , height = 480)
    
    #plotting the line graph for multiple attribute with the desired attributes. first set the plot then add lines
    datetime_vect <- strptime( paste(powerData$Date , powerData$Time) , "%d/%m/%Y %H:%M:%S")
    plot(x= datetime_vect,  y = powerData$Sub_metering_1,
         type="l", xlab="", ylab = "Energy sub metering" )
    lines(datetime_vect, powerData$Sub_metering_2,type="l",col="red")
    lines(datetime_vect, powerData$Sub_metering_3,type="l",col="blue")
    
    legend("topright" ,lty=c(1,1,1) , col =c("black","red","blue") , legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    #Closing the graphic device
    dev.off()
    
}