setwd("~/Exploratory Data Analysis/Course Project/1")

# Reading master text file
hh_power <- read.table("household_power_consumption.txt",stringsAsFactors = F, header = T, sep=";")

# Time vs Date Column
hh_power$Time_Date <- strptime(paste(hh_power$Date, hh_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Subsetting to get the indicated duration
date_hh_power <- subset(hh_power, hh_power$Date=="1/2/2007" | hh_power$Date == "2/2/2007")

# Line Graph
png("Plot2.png", width=480, height=480)
plot(date_hh_power$Time_Date,as.numeric(as.character(date_hh_power$Global_active_power)),
     type="l",xlab="Day",ylab="Global Active Power (kilowatts)") 
dev.off()