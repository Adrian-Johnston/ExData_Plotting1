# Set working directory to location of the file 'household_power_consumption.txt'
#downloaded and unzipped from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

setwd("C:/Users/Dell/Documents/R/exploratory_data")
dt.initial <- read.table("household_power_consumption.txt",  header=TRUE, sep=";")
dt.initial$datetime <- strptime(paste(dt.initial$Date, dt.initial$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
dt.subset<-dt.initial[as.Date(as.character(dt.initial$Date),  "%d/%m/%Y") %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]
dt.subset$Date<-as.Date(as.character(dt.subset$Date), "%d/%m/%Y")
dt.subset$Global_active_power<-as.numeric(as.character(dt.subset$Global_active_power))

png(filename="plot3.png",  width=480, height=480)
#png above works better, doesn't truncate the legend entries like dev.copy() was doing below

plot(dt.subset$datetime, as.numeric(as.character(dt.subset$Sub_metering_1)),type ="l",ylab = "Energy Sub Metering", xlab = "" ,col = "black")
lines(dt.subset$datetime,as.numeric(as.character(dt.subset$Sub_metering_2)),type ="l", col = "red")
lines(dt.subset$datetime,as.numeric(as.character(dt.subset$Sub_metering_3)),type ="l", col = "blue")
legend("topright", c("SUB METERING 1", "SUB METERING 2","SUB METERING 3"), lty= c(1,1), col = c("black", "red", "blue"), text.col = c("black", "red","blue"), cex=0.3)

#dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

