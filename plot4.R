library(chron)
library(data.table)

hpc = fread("household_power_consumption.txt")
hpc$Date = as.Date(hpc$Date, format = "%d/%m/%Y")

subsetDates = subset(hpc, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
subsetDates$Datetime = as.POSIXct(paste(subsetDates$Date, subsetDates$Time), 
                                  format="%Y-%m-%d %H:%M:%S")

subsetDates$Global_active_power = as.numeric(subsetDates$Global_active_power)
subsetDates$Sub_metering_1 = as.numeric(subsetDates$Sub_metering_1)
subsetDates$Sub_metering_2 = as.numeric(subsetDates$Sub_metering_2)
subsetDates$Voltage = as.numeric(subsetDates$Voltage)

png("./ExData_Plotting1/plot4.png")
par(mfrow = c(2, 2))
with(subsetDates, {
  plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(Datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(Datetime, Sub_metering_1, type = "l", ylim=c(0, 38), 
       ylab = "Energy sub metering", xlab = "")
  par(new=T)
  plot(Datetime, Sub_metering_2, type = "l", col="red", axes = F, 
       ylim=c(0, 38), ylab = "", xlab = "")
  par(new=T)
  plot(Datetime, Sub_metering_3, type = "l", col="blue", axes = F, 
       ylim=c(0, 38), ylab = "", xlab = "")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col= c("black", "red", "blue"), lty = 1, box.lwd = 0, cex = 0.9)
  plot(Datetime, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.off()