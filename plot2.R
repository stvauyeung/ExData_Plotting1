library(chron)
library(data.table)

hpc = fread("household_power_consumption.txt")
hpc$Date = as.Date(hpc$Date, format = "%d/%m/%Y")

subsetDates = subset(hpc, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
subsetDates$Global_active_power = as.numeric(subsetDates$Global_active_power)
subsetDates$Time = chron(times = subsetDates$Time)
subsetDates$Datetime = as.POSIXct(paste(subsetDates$Date, subsetDates$Time), 
                                  format="%Y-%m-%d %H:%M:%S")

png(file = "./ExData_Plotting1/plot2.png")
x = subsetDates$Datetime
y = subsetDates$Global_active_power
plot(x,y,type="l",ylab="Global Active Power (kilowatts)", xlab = "")
dev.off()
