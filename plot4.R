## Exploratory Data Analysis: project 1
## script for generating plot 4 multiple plots (2x2) on screen
## save plot 4 multiple plots to png format file

plot4 <- function( ) {
	HHPCdt <- fread("household_power_consumption.txt", nrow=2880, 
			skip=66637, na.strings="?")			## read in data table, required rows only
	setnames(HHPCdt, c("Date", "Time", "GAP", "GRP", "V", "GI", "SM1", "SM2", "SM3"))
	HHPCdt[, DateTime:= paste(Date, Time)]			## create DateTime column
	par(mfrow=c(2,2))							## set screen format 2x2
	with(HHPCdt, plot(strptime(DateTime, "%d/%m/%Y %H:%M:%S"), GAP, 
			type="l", xlab="", 
			ylab="Global Active Power"))			## generate plot 4(1,1)
	with(HHPCdt, plot(strptime(DateTime, "%d/%m/%Y %H:%M:%S"), V, 
			type="l", xlab="datetime", 
			ylab="Voltage"))					## generate plot 4(1,2)
	with(HHPCdt, plot(strptime(DateTime, "%d/%m/%Y %H:%M:%S"), SM1, 
			type="l", xlab="", ylab="Energy sub metering")) ## generate plot 4(2,1)
	lines(strptime(test1$DateTime, "%d/%m/%Y %H:%M:%S"), test1$SM2, col="Red")
	lines(strptime(test1$DateTime, "%d/%m/%Y %H:%M:%S"), test1$SM3, col="Blue")
	legend("topright", lwd=1, bty="n", cex=0.9, col=c("Black","Red","Blue"), 
			legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	with(HHPCdt, plot(strptime(DateTime, "%d/%m/%Y %H:%M:%S"), GRP, 
			type="l", xlab="datetime", 
			ylab="Global Reactive Power"))		## generate plot 4(2,2)
	dev.copy(png, file="plot4.png")				## save to required png format
	dev.off()
	par(mfrow=c(1,1))							## return to standard screen format
}