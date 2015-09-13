# Set working directory to location of the file 'household_power_consumption.txt'
#downloaded and unzipped from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
setwd("C:/Users/Dell/Documents/R/exploratory_data")
 
dt.initial <- read.table("household_power_consumption.txt",  header=TRUE, sep=";")
dt.subset<-dt.initial[as.Date(as.character(dt.initial$Date),  "%d/%m/%Y") %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]
#dt.subset[dt.subset=="?"]<-NA 
# Above line is not used but may be useful to eliminate '?' which appear in place of NAs

hist(as.numeric(as.character(dt.subset$Global_active_power)), breaks = 20, main = paste("Global Active Power"), col="red", xlab="Global Active Power (Kilowatts)")
#Experiments with breaks = value until matches example provided in the assignment

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()



