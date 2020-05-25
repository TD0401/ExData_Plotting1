plotHist <- function(){
    
    source("loadData.R")
    loadData()
    
    #Setting Graphic Device as png file with mentioned height and width
    png(file="plot1.png" , width = 480 , height = 480)
    
    #plotting the historgram with the desired attributes
    hist(powerData$Global_active_power, col="red", main="Global Active Power" , xlab = "Global Active Power (kilowatts)" , ylab = "Frequency")
    
    #Closing the graphic device
    dev.off()
    
    
}