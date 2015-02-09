#Coursera Course 4 - Week 1 Plotting Exercise
#Plot 4
setwd("C:\\Users\\jeniferjones\\Documents\\GitHub\\EXData_Plotting1")
filename<-"household_power_consumption.txt"
full_dataset<-read.table(filename, header=TRUE, sep=";")
#Subset data for the two days in february - note that the original date file is d/m/yyyy
feb_data<-subset(full_dataset, Date%in%c("1/2/2007", "2/2/2007"))
#Convert the factor value of the required columns to numeric
feb_data$Global_active_power<-as.numeric(as.character(feb_data$Global_active_power))
feb_data$Sub_metering_1<-as.numeric(as.character(feb_data$Sub_metering_1))
feb_data$Sub_metering_2<-as.numeric(as.character(feb_data$Sub_metering_2))
feb_data$Sub_metering_3<-as.numeric(as.character(feb_data$Sub_metering_3))
feb_data$Voltage<-as.numeric(as.character(feb_data$Voltage))
feb_data$Global_reactive_power<-as.numeric(as.character(feb_data$Global_reactive_power))
#Load the lubridate library to easily deal with date/time issues
library(lubridate)
#Convert the date and time fields as well as identifying the day of the week for the Date (as a check)
feb_data$Date<-dmy(feb_data$Date)
feb_data$DOW<-wday(feb_data$Date, label=TRUE)
#Concatenate into one field for plotting
feb_data$date_time<-as.POSIXct(paste(feb_data$Date, feb_data$Time), format="%Y-%m-%d %H:%M:%S")
str(feb_data$Sub_metering_2)

#Create one plot with 4 sub plots
par(mfrow=c(2,2))
plot(feb_data$date_time, feb_data$Global_active_power, type="l", xlab="", ylab = "Global Active Power")
plot(feb_data$date_time, feb_data$Voltage, type="l", xlab="datetime", ylab = "Voltage")
plot(feb_data$date_time, feb_data$Sub_metering_1, col="black", type = "l", 
     ylab = "Energy sub metering", xlab="")
lines(feb_data$date_time, feb_data$Sub_metering_2, col="red",)
lines(feb_data$date_time, feb_data$Sub_metering_3, col="blue")
legend("topright",lwd=1, bty="n", col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(feb_data$date_time, feb_data$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power")
dev.copy(png, file = "Plot4.png")
dev.off()