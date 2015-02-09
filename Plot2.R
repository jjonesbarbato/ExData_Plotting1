#Coursera Course 4 - Week 1 Plotting Exercise
#Plot 2
setwd("C:\\Users\\jeniferjones\\Documents\\GitHub\\EXData_Plotting1")
filename<-"household_power_consumption.txt"
full_dataset<-read.table(filename, header=TRUE, sep=";")
#Subset data for the two days in february - note that the original date file is d/m/yyyy
feb_data<-subset(full_dataset, Date%in%c("1/2/2007", "2/2/2007"))
#Convert the factor value of power to numeric
feb_data$Global_active_power<-as.numeric(as.character(feb_data$Global_active_power))
#Load the lubridate library to easily deal with date/time issues
library(lubridate)
#Convert the date and time fields as well as identifying the day of the week for the Date (as a check)
feb_data$Date<-dmy(feb_data$Date)
feb_data$DOW<-wday(feb_data$Date, label=TRUE)
#Concatenate into one field for plotting
feb_data$date_time<-as.POSIXct(paste(feb_data$Date, feb_data$Time), format="%Y-%m-%d %H:%M:%S")

#Create a line plot
plot(feb_data$date_time, feb_data$Global_active_power, type="l", 
     xlab="", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot2.png")
dev.off()