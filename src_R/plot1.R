# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3

# powerset <- read.table("/Users/bdolimier/developer/perso/ExploratoryDataAnalysis/household_power_consumption.txt")

powerset <- read.csv("/Users/bdolimier/developer/perso/ExploratoryDataAnalysis/household_power_consumption.txt" , head=TRUE , sep=";" , dec=".", stringsAsFactors=FALSE, as.is=TRUE) 

datum <- strptime( powerset[,1] , "%d/%m/%Y")

datum[558]

head( powerset[,1])

# listset <- list()
# listset[[1]] = read.table(test_human_activity_ds)
# listset[[2]] = read.table(train_human_activity_ds)

