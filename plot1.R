#reading full data
data <- read.table("./data/household_power_consumption.txt", 
                   na.strings="?", header=TRUE, sep=";", stringsAsFactors=FALSE,
                   dec=".")
req_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#subsetting and png creation
globalActivePower <- as.numeric(req_subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()