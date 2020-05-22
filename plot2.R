plotLineGraph <- function(){
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
    png(file="plot2.png" , width = 480 , height = 480)
    
    #plotting the historgram with the desired attributes
    datetime_vect <- strptime( paste(powerData$Date , powerData$Time) , "%d/%m/%Y %H:%M:%S")
   plot(x= datetime_vect,  y = powerData$Global_active_power, type="l", xlab="",
           ylab = "Global Active Power (kilowatts)" )
    
    #Closing the graphic device
    dev.off()
    
}