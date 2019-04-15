#Read data
all_datas <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subset data
all_datas$Date <- as.Date(all_datas$Date, "%d/%m/%Y")
datas <- subset(all_datas, Date >= "2007-02-01" & Date <= "2007-02-02")

#Plot
png("plot1.png", height = 480, width = 480)
hist(datas$Global_active_power, xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
