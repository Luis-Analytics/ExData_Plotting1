#Coursera Data Exploratory Analysis 
#Course Project 1 

#Read file and subset February Data
Mydata=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
as.Date(Mydata$Date, format="%d/%m/%Y")

Febdata<-Mydata[Mydata$Date %in% c("1/2/2007","2/2/2007"), ]


#Construct Plots
Date<-strptime(paste(Febdata$Date,Febdata$Time, sep=""), "%d/%m/%Y %H:%M:%S")
Globalactivepower<-as.numeric(Febdata$Global_active_power)
subMetering1 <- as.numeric(Febdata$Sub_metering_1)
subMetering2 <- as.numeric(Febdata$Sub_metering_2)
subMetering3 <- as.numeric(Febdata$Sub_metering_3)
Globalreactivepower<-as.numeric(Febdata$Global_reactive_power)
voltage<-as.numeric(Febdata$Voltage)



png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

plot(Date, Globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(Date, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(Date, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Date, subMetering2, type="l", col="red")
lines(Date, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(Date, Globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
