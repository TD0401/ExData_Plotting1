#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#merging NEI data with SCC data by SCC column name
mrg_data <- merge(NEI,SCC, by = "SCC" , all.x = TRUE)

#filtering only Coal Combustion Data hence put both greps
coal_data <- mrg_data[grepl("Coal|coal", mrg_data$Short.Name) & grepl("Comb|comb", mrg_data$Short.Name),1:8]

library(dplyr)
final_data <- coal_data %>% group_by(year, type) %>% summarise(totalEmissions = sum(Emissions , na.rm = TRUE)) 
png("plot4.png")
library(ggplot2)
g <- ggplot(final_data, aes(as.factor(year) , totalEmissions , col = type , group = type))
g <- g + geom_point()
g <- g + geom_line() 
g <- g +  scale_colour_discrete(name = "Type of sources") 
g <- g + labs(title = "Total Coal Combustion PM2.5 Emissions over years for different sources" ,x = "year",  y = "Total PM2.5")
print(g)
dev.off()
