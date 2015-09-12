power<-read.table("household_power_consumption.txt",head=TRUE, sep=";", stringsAsFactors = FALSE)
power$Date<-as.Date(power$Date,"%d/%m/%Y")
sub_power<-power[power$Date=="2007-02-01"|power$Date=="2007-02-02",]
sub_power$Date<-as.Date(sub_power$Date,"%d/%m/%Y")
sub_power[,3:9]<-apply(sub_power[,3:9], 2, function(x) as.numeric(x))
par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 2, 0)) 
Date_Time<-strptime((paste0(sub_power$Date," ", sub_power$Time)), format = "%Y-%m-%d %H:%M:%S")
#Plot 1
plot(Date_Time,sub_power[,3], type = "l", xlab = "", ylab = "Global Active Power")
#Plot 2
plot(Date_Time,sub_power[,5], type = "l", xlab = "datetime", ylab = "Voltage")
#Plot 3
Sub_metering_1<-sub_power[,7]
Sub_metering_2<-sub_power[,8]
Sub_metering_3<-sub_power[,9]
plot(Date_Time,Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(Date_Time,Sub_metering_2, type = "l", xlab = "", ylab = "", col = "red")
points(Date_Time,Sub_metering_3, type = "l", xlab = "", ylab = "", col = "blue")
legend(x= 1170325000, y = 42,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", lty = 1, col = c("black", "red","blue"), y.intersp = .5, seg.len = .5, pt.cex = .5)
#Plot 4
plot(Date_Time,sub_power[,4], type = "l", xlab = "datetime", ylab = "Global_reactive_power")