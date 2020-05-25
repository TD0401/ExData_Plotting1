#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (
#    fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")

#On road data (meaning vehicle data) for baltimore and LA
vehicle_data <- NEI[ (NEI$fips == "24510" | NEI$fips == "06037"   ) & NEI$type == "ON-ROAD" ,]
library(dplyr)
vehicle_data$fips <- recode(vehicle_data$fips , "24510" ="Baltimore" , "06037" = "Los Angeles")
final_data <- vehicle_data %>% group_by(year, fips) %>% summarise(totalEmissions = sum(Emissions , na.rm = TRUE)) 
png("plot6.png")
library(ggplot2)
g <- ggplot(final_data, aes(as.factor(year) , totalEmissions, col = fips , group = fips ))
g<- g + geom_line()
g <- g + geom_point()
g <- g +  scale_colour_discrete(name = "Type of sources") 
g <- g + labs(title = "Total Motor Vehicles PM2.5 Emissions in Baltimore and LA" ,x = "year",  y = "Total PM2.5")
print(g)
dev.off()
