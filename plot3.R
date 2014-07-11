## Exploratory Data Analysis: project 1
## script for generating plot 3 multi-lineplot on screen
## save plot 3 multi-lineplot to png format file

plot3 <- function( ) {
	HHPCdt <- fread("household_power_consumption.txt", nrow=2880, 
			skip=66637, na.strings="?")		## read in data table, required rows only
	setnames(HHPCdt, c("Date", "Time", "GAP", "GRP", "V", "GI", "SM1", "SM2", "SM3"))
	HHPCdt[, DateTime:= paste(Date, Time)]		## create DateTime column
	with(HHPCdt, plot(strptime(DateTime, "%d/%m/%Y %H:%M:%S"), SM1, 
			type="l", xlab="", ylab="Energy sub metering"))
	lines(strptime(test1$DateTime, "%d/%m/%Y %H:%M:%S"), test1$SM2, col="Red")
	lines(strptime(test1$DateTime, "%d/%m/%Y %H:%M:%S"), test1$SM3, col="Blue")
	legend("topright", lwd=1, cex=0.9, col=c("Black","Red","Blue"), 
			legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	dev.copy(png, file="plot3.png")			## save to required png format
	dev.off()
}