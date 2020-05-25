#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

NEI <- readRDS("summarySCC_PM25.rds")

# grouping by year and type and summing up total data
library(dplyr)
final_data <- NEI[NEI$fips == "24510" ,] %>% group_by(year, type) %>% summarise_if(is.numeric, sum, na.rm=TRUE)
library(ggplot2)
png("plot3.png")
g <- ggplot(final_data, aes(as.factor(year) , Emissions , col = type , group = type))
g <- g + geom_point()
g <- g + geom_line() 
g <- g +  scale_colour_discrete(name = "Type of sources") 
g <- g + labs(title = "Total PM2.5 Emissions over years for different type of sources" ,x = "year",  y = "Total PM2.5")
g <- g + theme(legend.title = element_text(face = "bold"))
print(g)
dev.off()