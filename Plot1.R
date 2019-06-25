setwd("~/Exploratory Data Analysis/Course Project/1")

# Reading master text file
hh_power <- read.table("household_power_consumption.txt", stringsAsFactors = F, header = T, sep = ";")

# Subsetting to get the indicated duration
date_hh_power <- subset(hh_power, hh_power$Date=="1/2/2007" | hh_power$Date == "2/2/2007")

# Histogram
png("Plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(date_hh_power$Global_active_power)),
     col="red",border = "black", main="Global Active Power", 
     xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.off()
