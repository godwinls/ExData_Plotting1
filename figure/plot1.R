#Read in and subset
DATA<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
plotData<-DATA[DATA$Date %in% c("1/2/2007","2/2/2007"),]


#Convert Date and time
#
#plotData[1]<-lapply(plotData[1],as.Date,format="%d/%m/%Y")
#time<-paste(plotData$Date,plotData$Time)
#plotData$Time<-strptime(time,format="%Y-%m-%d %H:%M:%S")

#plot the first graph,default png size is 480*480
png(filename="plot1.png")
hist(Global_active_power,col="red",xlab="Global active power(kilowatts)",main="Global_active_power")
dev.off()