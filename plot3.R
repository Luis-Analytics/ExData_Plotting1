#Coursera Data Exploratory Analysis 
#Course Project 1 

#Read file and subset February Data
Mydata=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
as.Date(Mydata$Date, format="%d/%m/%Y")

Febdata<-Mydata[Mydata$Date %in% c("1/2/2007","2/2/2007"), ]

#Construct Plot
Date<-strptime(paste(Febdata$Date,Febdata$Time, sep=""), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(Febdata$Sub_metering_1)
subMetering2 <- as.numeric(Febdata$Sub_metering_2)
subMetering3 <- as.numeric(Febdata$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(Date,subMetering1, type="l",xlab="", ylab="Energy Submetering")
lines(Date, subMetering2, type="l", col="red")
lines(Date, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

