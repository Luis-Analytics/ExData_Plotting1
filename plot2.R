#Coursera Data Exploratory Analysis 
#Course Project 1 


#Read file and subset February Data
Mydata=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
as.Date(Mydata$Date, format="%d/%m/%Y")

Febdata<-Mydata[Mydata$Date %in% c("1/2/2007","2/2/2007"), ]

#Construct Plot
Date<-strptime(paste(Febdata$Date,Febdata$Time, sep=""), "%d/%m/%Y %H:%M:%S")
Globalactivepower<-as.numeric(Febdata$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(Date, Globalactivepower,  type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
