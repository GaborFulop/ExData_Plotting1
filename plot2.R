#we need to repeat the previous sequence
data = read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date = as.Date(data$Date, '%d/%m/%Y')
data = subset(data, Date == '2007-02-01' | Date == '2007-02-02')
data = transform(data, Global_active_power = as.numeric(Global_active_power))
data$Date.Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
png("plot2.png")
plot(data$Date.Time, data$Global_active_power, type='l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()
