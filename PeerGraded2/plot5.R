#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?


NEI <- readRDS("summarySCC_PM25.rds")

#getting data for baltimore and On Road source
vehicle_data <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD" , ]

library(dplyr)
final_data <- vehicle_data %>% group_by(year) %>% summarise(totalEmissions = sum(Emissions , na.rm = TRUE)) 
png("plot5.png")
library(ggplot2)
g <- ggplot(final_data, aes(as.factor(year) , totalEmissions , group = 1 ))
g<- g + geom_line(col = "black")
g <- g + geom_point()
g <- g + labs(title = "Total Motor Vehicles PM2.5 Emissions over years in Baltimore" ,x = "year",  y = "Total PM2.5")
print(g)
dev.off()
