setwd("~/Exploratory Data Analysis/Course Project/1")

# Reading master text file
hh_power <- read.table("household_power_consumption.txt",stringsAsFactors = F, header = T, sep=";")

# Time vs Date Column
hh_power$Time_Date <- strptime(paste(hh_power$Date, hh_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Subsetting to get the indicated duration
date_hh_power <- subset(hh_power, hh_power$Date=="1/2/2007" | hh_power$Date == "2/2/2007")

# Multi-plot
png("Plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(date_hh_power, plot(Time_Date, as.numeric(as.character(Global_active_power)),type="l", xlab="", ylab="Global Active Power"))
with(date_hh_power, plot(Time_Date, as.numeric(as.character(Voltage)), type = "l", xlab="datetime", ylab="Voltage"))
with(date_hh_power, plot(Time_Date, as.numeric(as.character(Sub_metering_1)),type="l", xlab="", ylab="Energy sub metering"))
with(date_hh_power, lines(Time_Date, as.numeric(as.character(Sub_metering_2)),type="l", col= "red"))
with(date_hh_power, lines(Time_Date, as.numeric(as.character(Sub_metering_3)),type="l", col= "blue"))
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(date_hh_power, plot(Time_Date, as.numeric(as.character(Global_reactive_power)),type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()
