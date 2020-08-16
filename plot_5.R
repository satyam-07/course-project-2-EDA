data <- readRDS('summarySCC_PM25.rds')
sub_dat <- data[data$fips=='24510' & data$type == 'ON-ROAD',]
temp_dat <- aggregate(Emissions~year,sub_dat,sum)
png('plot_5.png')
g <- ggplot(temp_dat, aes(factor(year), Emissions,col=year,fill=year,label=round(Emissions,2)))
g+geom_bar(stat='identity')+ggtitle('emission from on road sources in baltimore from 1999-2008')+xlab('years')+ylab('Emissions')
dev.off()