data <- readRDS('summarySCC_PM25.rds')
sub <- data[(data$fips=='24510'|data$fips=='06037') & data$type=='ON-ROAD']
sub$fips[sub$fips=='24510']<-'BALTIMORE'
sub$fips[sub$fips=='06037']<- 'LOS ANGELES'
png('plot_6.png')
g<- ggplot(temp,aes(factor(year),Emissions,fill=fips))
g+facet_grid(fips~.,scales="free")+geom_bar(stat='identity')+ggtitle('comparision b/w emissions at baltimore and los angeles by on road sources from 1999-2008')+ylab('Emissions')+xlab('year')
dev.off()
