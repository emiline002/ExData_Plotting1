power<-read.table("household_power_consumption.txt",head=TRUE, sep=";", stringsAsFactors = FALSE)
power$Date<-as.Date(power$Date,"%d/%m/%Y")
sub_power<-power[power$Date=="2007-02-01"|power$Date=="2007-02-02",]
sub_power$Date<-as.Date(sub_power$Date,"%d/%m/%Y")
sub_power[,3:9]<-apply(sub_power[,3:9], 2, function(x) as.numeric(x))
Sub_metering_1<-sub_power[,7]
Sub_metering_2<-sub_power[,8]
Sub_metering_3<-sub_power[,9]
plot(Date_Time,Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(Date_Time,Sub_metering_2, type = "l", xlab = "", ylab = "", col = "red")
points(Date_Time,Sub_metering_3, type = "l", xlab = "", ylab = "", col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black", "red","blue"), y.intersp = .65, seg.len = .5, cex = .65)
