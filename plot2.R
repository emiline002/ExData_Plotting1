power<-read.table("household_power_consumption.txt",head=TRUE, sep=";", stringsAsFactors = FALSE)
power$Date<-as.Date(power$Date,"%d/%m/%Y")
sub_power<-power[power$Date=="2007-02-01"|power$Date=="2007-02-02",]
sub_power$Date<-as.Date(sub_power$Date,"%d/%m/%Y")
sub_power[,3:9]<-apply(sub_power[,3:9], 2, function(x) as.numeric(x))
Date_Time<-strptime((paste0(sub_power$Date," ", sub_power$Time)), format = "%Y-%m-%d %H:%M:%S")
plot(Date_Time,sub_power[,3], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
