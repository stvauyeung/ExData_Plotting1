library(chron)
library(data.table)

hpc = fread("household_power_consumption.txt")
hpc$Date = as.Date(hpc$Date, format = "%d/%m/%Y")

subsetDates = subset(hpc, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
subsetDates$Time = chron(times = subsetDates$Time)
subsetDates$Datetime = as.POSIXct(paste(subsetDates$Date, subsetDates$Time), 
                                  format="%Y-%m-%d %H:%M:%S")

subsetDates$Sub_metering_1 = as.numeric(subsetDates$Sub_metering_1)
subsetDates$Sub_metering_2 = as.numeric(subsetDates$Sub_metering_2)

png("./ExData_Plotting1/plot3.png")
plot(x, subsetDates$Sub_metering_1, type = "l", ylim=c(0, 38), 
     ylab = "Energy sub metering", xlab = "")
par(new=T)
plot(x, subsetDates$Sub_metering_2, type = "l", col="red", axes = F, 
     ylim=c(0, 38), ylab = "", xlab = "")
par(new=T)
plot(x, subsetDates$Sub_metering_3, type = "l", col="blue", axes = F, 
     ylim=c(0, 38), ylab = "", xlab = "")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col= c("black", "red", "blue"), lty = 1)
dev.off()