#Reads data for any plot
inputdata <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
inputheader <- read.table("household_power_consumption.txt", sep = ";", nrows = 1, header = TRUE)
colnames(inputdata) <- colnames(inputheader)
#That's your reading in code for all the plots.
#Plot 1 specific starts here
png(filename = "plot1.png")
hist(inputdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "RED")
dev.off()