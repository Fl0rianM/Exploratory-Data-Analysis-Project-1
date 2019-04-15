#Read datas
all_datas <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subset datas
datas <- subset(all_datas, Date >= "2007-02-01" & Date <= "2007-02-02")

#Convert dates
datas$Datetime <- strptime(paste(datas$Date, datas$Time), "%Y-%m-%d %H:%M:%S")

#Create png
png("plot2.png", height = 480, width = 480)
plot(x = datas$Datetime, y = datas$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
