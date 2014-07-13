#Read in and subset
DATA<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
plotData<-DATA[DATA$Date %in% c("1/2/2007","2/2/2007"),]


#Convert Date and time
#
plotData[1]<-lapply(plotData[1],as.Date,format="%d/%m/%Y")
time<-paste(plotData$Date,plotData$Time)
plotData$Time<-strptime(time,format="%Y-%m-%d %H:%M:%S")

#plot the fourth graph,default png size is 480*480
png(filename="plot4.png")
par(mfcol=c(2,2))
#upleft
plot(plotData$Time,Global_active_power,type="l",xlab="",ylab="Global active power (kilowatts)")
#upright
plot(plotData$Time,plotData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(plotData$Time,plotData$Sub_metering_2,type="l",col="red")
points(plotData$Time,plotData$Sub_metering_3,type="l",col="blue")
legend("topright",col = c("black", "red", "blue"),lty= 1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,bty="n")
#downleft
plot(plotData$Time,plotData$Voltage,type="l",xlab="datetime",ylab="Voltage")
#downright
plot(plotData$Time,plotData$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
