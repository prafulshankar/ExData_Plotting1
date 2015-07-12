#reading full data
data <- read.table("./data/household_power_consumption.txt", header=TRUE, 
                   sep=";", stringsAsFactors=FALSE, dec=".")
req_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#extraction
rawdate <- as.Date(req_subset$Date, format="%d/%m/%Y")
rawtime <- req_subset$Time
datetime <- as.POSIXct(c(rawdate, rawtime))
subm1 <- as.numeric(req_subset$Sub_metering_1)
subm2 <- as.numeric(req_subset$Sub_metering_2)
subm3 <- as.numeric(req_subset$Sub_metering_3)


#plotting
png("plot3.png", width=480, height=480)
plot(datetime, subm1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subm2, type="l", col="red")
lines(datetime, subm3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()