## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
## Using the base plotting system, make a plot showing the total PM2.5 emission from
## all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")

#only need to show total emissions so doing sum
mn <- with(NEI , tapply(Emissions, year, sum, na.rm = TRUE))
png("plot1.png")
plot( names(mn) , mn, pch = 20, type = "o", xlim = range(1999:2008),  xlab = "year" , ylab = "Total PM2.5",xaxt='n' ,main = "Total PM2.5 Emission Trend over years" )
#setting x axis as per our year range
axis(1, at = seq(1999L, 2008L, by = 3L))
dev.off()