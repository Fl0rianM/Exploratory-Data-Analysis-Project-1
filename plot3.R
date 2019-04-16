#Read datas
all_datas <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert as dates & subset
all_datas$Date <- as.Date(all_datas$Date, "%d/%m/%Y")
datas <- subset(all_datas, Date >= "2007-02-01" & Date <= "2007-02-02")
datas$Datetime <- strptime(paste(datas$Date, datas$Time), "%Y-%m-%d %H:%M:%S")

#Create plot
png("plot3.png", height = 480, width = 480)
plot(x = datas$Datetime, y = datas$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(x = datas$Datetime, y = datas$Sub_metering_2, type = "l", col = "red")
points(x = datas$Datetime, y = datas$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)
dev.off()
