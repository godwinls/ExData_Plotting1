#Read in and subset
DATA<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
plotData<-DATA[DATA$Date %in% c("1/2/2007","2/2/2007"),]


#Convert Date and time
#
plotData[1]<-lapply(plotData[1],as.Date,format="%d/%m/%Y")
time<-paste(plotData$Date,plotData$Time)
plotData$Time<-strptime(time,format="%Y-%m-%d %H:%M:%S")

#plot the second graph,default png size is 480*480
png(filename="plot2.png")
plot(plotData$Time,Global_active_power,type="l",xlab="",ylab="Global active power (kilowatts)")
dev.off()