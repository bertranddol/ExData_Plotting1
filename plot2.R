# 2 - By datetime 
# Household power consumption data model
# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3

# may want to set your working directory first...
wd <- setwd("~/developer/perso/ExploratoryDataAnalysis/ExData_Plotting1")

# read data
powerset <- read.table("household_power_consumption.txt" , header=TRUE, sep = ";", na.strings = "?")

# restrict to first 2 days in feb 2007
powerset$Date <- as.Date(powerset$Date, format ="%d/%m/%Y") 
onedayPowerset  <- subset(powerset, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# create a date&time dimension
DateTime <- paste( onedayPowerset$Date, onedayPowerset$Time )
onedayPowerset$dateDT <- as.POSIXct(strptime(DateTime, "%Y-%m-%d %H:%M:%S"))

# Powerset line graph for february 2007 1st & 2nd by time
myplot <- png(filename="plot2.png", width=480, height =480)
with( onedayPowerset , plot(dateDT,Global_active_power , type="l" , ylab="Global Active Power (kw)" ) )
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat") )
dev.off()
