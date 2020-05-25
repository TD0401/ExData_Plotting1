plotLineGraph <- function(){
    source("loadData.R")
    loadData()
    
    #Setting Graphic Device as png file with mentioned height and width
    png(file="plot2.png" , width = 480 , height = 480)
    
    #plotting the line graph with the desired attributes
    datetime_vect <- strptime( paste(powerData$Date , powerData$Time) , "%d/%m/%Y %H:%M:%S")
   plot(x= datetime_vect,  y = powerData$Global_active_power, type="l", xlab="",
           ylab = "Global Active Power (kilowatts)" )
    
    #Closing the graphic device
    dev.off()
    
}