library(data.table)

hpc = fread("household_power_consumption.txt")
hpc$Date = as.Date(hpc$Date)

subsetDates = subset(hpc, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
subsetDates$Global_active_power = as.numeric(subsetDates$Global_active_power)

png(file = "./ExData_Plotting1/plot1.png")
hist(subsetDates$Global_active_power, col = "red", ylim = c(0, 1200), 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()