data <- readRDS('summarySCC_PM25.rds')
scc <- readRDS('Source_Classification_Code.rds')
sub_coal <- grepl('coal',scc$Short.Name)
sources <- scc[sub_coal,]
temp <- data[data$SCC %in% sources$SCC,]
fin_dat <- aggregate(Emissions~year,temp,sum)
png('plot_4.png')
g <- ggplot(fin_dat, aes(factor(year), Emissions,col=year,fill=year,label=round(Emissions,2)))
g+geom_bar(stat='identity')+ggtitle('emission from coal sources from 1999 to 2008')+xlab('years')+ylab('Emissions')
dev.off()