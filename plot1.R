#first, we need to read the dataset
data = read.table("household_power_consumption.txt", sep=";", header=TRUE)
#we specify the format
data$Date = as.Date(data$Date, '%d/%m/%Y')
data = subset(data, Date == '2007-02-01' | Date == '2007-02-02')
#now, we can transform the data and create the visualization of it
data = transform(data, Global_active_power = as.numeric(Global_active_power))
png("plot1.png")
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
