#here, we put our plots together
data = read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date = as.Date(data$Date, '%d/%m/%Y')
data = subset(data, Date == '2007-02-01' | Date == '2007-02-02')
data = transform(data, Global_active_power = as.numeric(Global_active_power))
data$Date.Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
png("plot4.png")
par (mfrow = c(2,2))
plot(data$Date.Time, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")
plot(data$Date.Time, data$Voltage, xlab="datetime", ylab="Voltage", type="l")
plot(data$Date.Time, data$Sub_metering_1, type='l', xlab = '', ylab = 'Energy sub metering')
lines(data$Date.Time, data$Sub_metering_2, type='l', col = "red")
lines(data$Date.Time, data$Sub_metering_3, type='l', col = "blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Date.Time, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()