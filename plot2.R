#reading full data
data <- read.table("./data/household_power_consumption.txt", 
                   header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
req_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#changing format of dates
rawdate <- as.Date(req_subset$Date, format="%d/%m/%Y")
rawtime <- req_subset$Time
datetime <- as.POSIXct(c(rawdate, rawtime))
globalActivePower <- as.numeric(req_subset$Global_active_power)

#plotting
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()