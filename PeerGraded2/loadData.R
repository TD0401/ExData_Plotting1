loadData <- function(){
    #creating data directory if not present already 
    
    if(!file.exists("data")){
        dir.create("data")
    }
    
    #downloading zip file if not already present
    if(!file.exists("data/ExtData.zip")){
        fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        download.file(fileurl ,"data/ExtData.zip", method = "curl")
    }
    
    #unzipping if not present already
    if(!file.exists("data/ExtData/Source_Classification_Code.rds") & !file.exists("data/ExtData/summarySCC_PM25.rds") ){
        unzip("data/ExtData.zip",exdir =getwd())
    }

    ##Place the data in same directory as 
    
}