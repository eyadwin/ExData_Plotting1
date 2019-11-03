dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Reads in data from file then subsets data for specified dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##convert the Time variable to Time class 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)

## Plot 2
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()