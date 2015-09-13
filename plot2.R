# Set working directory to location of the file 'household_power_consumption.txt'
#downloaded and unzipped from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
setwd("C:/Users/Dell/Documents/R/exploratory_data")
dt.initial <- read.table("household_power_consumption.txt",  header=TRUE, sep=";")
dt.initial$datetime <- strptime(paste(dt.initial$Date, dt.initial$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
dt.subset<-dt.initial[as.Date(as.character(dt.initial$Date),  "%d/%m/%Y") %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]
dt.subset$Date<-as.Date(as.character(dt.subset$Date), "%d/%m/%Y")
dt.subset$Global_active_power<-as.numeric(as.character(dt.subset$Global_active_power))

plot(dt.subset$datetime, dt.subset$Global_active_power,type ="l",ylab = "Global Active Power", xlab = "" ,col = "black")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

