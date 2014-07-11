## Exploratory Data Analysis: project 1
## script for generating plot 2 lineplot on screen
## save plot 2 lineplot to png format file

plot2 <- function( ) {
	HHPCdt <- fread("household_power_consumption.txt", nrow=2880, 
			skip=66637, na.strings="?")		## read in data table, required rows only
	setnames(HHPCdt, c("Date", "Time", "GAP", "GRP", "V", "GI", "SM1", "SM2", "SM3"))
	HHPCdt[, DateTime:= paste(Date, Time)]		## create DateTime column
	with(HHPCdt, plot(strptime(DateTime, "%d/%m/%Y %H:%M:%S"), GAP, 
			type="l", main="Global Active Power", xlab="", 
			ylab="Global Active Power (kilowatts)"))	## generate plot
	dev.copy(png, file="plot2.png")			## save to required png format
	dev.off()
}