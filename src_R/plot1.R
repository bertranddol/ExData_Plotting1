# powerser data model:
# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3

# may want to set your working directory first...
wd <- setwd("~/developer/perso/ExploratoryDataAnalysis/ExData_Plotting1")

powerset <- read.table("household_power_consumption.txt" , header=TRUE, sep = ";", na.strings = "?")

#powerset$Date <- strptime( powerset$Date , "%d/%m/%Y")
powerset$Date <- as.Date(powerset$Date, format ="%d/%m/%Y") 

onedayPowerset  <- subset(powerset, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
head( onedayPowerset )

## Make a histogram to explore the data
myplot <- png(filename="figure/plot1.png", width=480, height =480)
hist(onedayPowerset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

