#Coursera Course 4 - Week 1 Plotting Exercise
#Plot 1
setwd("C:\\Users\\jeniferjones\\Documents\\GitHub\\EXData_Plotting1")
filename<-"household_power_consumption.txt"
full_dataset<-read.table(filename, header=TRUE, sep=";")
#Subset data for the two days in february - note that the original date file is d/m/yyyy
feb_data<-subset(full_dataset, Date%in%c("1/2/2007", "2/2/2007"))
#Convert the factor value of power to numeric
feb_data$Global_active_power<-as.numeric(as.character(feb_data$Global_active_power))
hist(feb_data$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     xlim = c(0,6),
     ylim = c(0,1200), 
     breaks=18,
     xaxt="n")
axis(1, at = seq(0,6,by=2))
dev.copy(png, file = "Plot1.png")
dev.off()