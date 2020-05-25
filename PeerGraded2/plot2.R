#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (
#    fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")

#summing up since only need to show total emission and only for fips Baltimore
mn <- with(NEI[NEI$fips =="24510" , ] , tapply(Emissions, year, sum, na.rm = TRUE))
png("plot2.png")
plot( names(mn) , mn, type = "o", pch = 20,xlim = range(1999:2008),  xlab = "year" , ylab = "Total PM2.5 Emission",xaxt='n' ,main = "Total PM2.5 Emission Trend over years for Baltimore, Maryland" )
axis(1, at = seq(1999L, 2008L, by = 3L))
dev.off()