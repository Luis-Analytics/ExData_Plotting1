#Coursera Data Exploratory Analysis 
#Course Project 1 

#Read file and subset February Data
Mydata=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
as.Date(Mydata$Date, format="%d/%m/%Y")

Febdata<-Mydata[Mydata$Date %in% c("1/2/2007","2/2/2007"), ]

Globalactivepower<-as.numeric(Febdata$Global_active_power)


#Construct Plot
png("plot1.png", width = 480, height = 480 )
hist(Globalactivepower,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
