library(chron)
library(data.table)

hpc = fread("household_power_consumption.txt")
hpc$Date = as.Date(hpc$Date)

subsetDates = subset(hpc, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))