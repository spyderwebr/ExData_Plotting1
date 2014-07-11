## Exploratory Data Analysis: project 1
## script for generating plot 1 histogram on screen
## save plot 1 histogram to png format file

plot1 <- function( ) {
	HHPCdt <- fread("household_power_consumption.txt", nrow=2880, 
			skip=66637, na.strings="?")		## read in data table, required rows only
	setnames(HHPCdt, c("Date", "Time", "GAP", "GRP", "V", "GI", "SM1", "SM2", "SM3"))
	hist(HHPCdt$GAP, col="Red", xlab="Global Active Power (kilowatts)", 
			main="Global Active Power")		## generate histogram
	dev.copy(png, file="plot1.png")			## save to required png format
	dev.off()
}