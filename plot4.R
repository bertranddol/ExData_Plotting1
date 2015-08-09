# 4 Global_active_power;Global_reactive_power, Voltage, Sub metering by time - multiple base plot
# Household power consumption data model:
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

# output device
myplot <- png(filename="plot4.png", width=480, height =480)

# 4 quadrant canvas - all 4 february 2007 1st & 2nd by time
par(mfrow = c(2, 2))

# subgraph 1 - Global Active Power
with( onedayPowerset , plot(dateDT,Global_active_power , type="l" , ylab="Global Active Power (kw)" , xlab="Date Time" ) )
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat") )

# subgraph 2 - Voltage 
with( onedayPowerset , plot(dateDT,Voltage , type="l" , ylab="Voltage" , xlab="Date Time") )
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat") )

# subgraph 3 - Sub Metering
with( onedayPowerset , plot(dateDT,Global_intensity  , type="n" , ylab="Energy Sub Metering" , xlab="Date Time" ) )
with( onedayPowerset , points( dateDT , Sub_metering_1 , type="l" , col="black") )
with( onedayPowerset , points( dateDT , Sub_metering_2 , type="l" , col="red") )
with( onedayPowerset , points( dateDT , Sub_metering_3 , type="l" , col="blue") )

axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat") )
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# subgraph 4 - Global_reactive_power
with( onedayPowerset , plot(dateDT,Global_reactive_power , type="l" , ylab="Global Active Power (kw)" , xlab="Date Time" ) )
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat") )

dev.off()
