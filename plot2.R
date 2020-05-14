#Reads data for any plot
inputdata <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
inputheader <- read.table("household_power_consumption.txt", sep = ";", nrows = 1, header = TRUE)
colnames(inputdata) <- colnames(inputheader)
#That's your reading in code for all the plots.
inputdata$Time <- levels(droplevels(inputdata$Time)) # Makes TimeSinceEpoch easier
#SecondsSinceEpoch is what lets us plot the two days as different points on the graph
#You do it by adding together the seconds since epoch of the date: Feb 1 or Feb 2
#Add to that the time since the start of that day, using strptime on the input time after turning into a character vector
#There were a bunch of levels in it when I read it in, hence dropping the levels up above
inputdata$SecondsSinceEpoch <- as.numeric(format(strptime(inputdata$Date, format = "%d/%m/%Y"), format = "%s")) + strptime(inputdata$Time, format = "%H:%M:%S")
# inputdata$DayofWeek <- weekdays(as.Date(inputdata$Date, format = "%d/%m/%Y")) #You'd think you would need this but r handles this.. kind of. See below.
png(filename = "plot2.png")
plot((inputdata$SecondsSinceEpoch - 22000), inputdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#I'd love to be able to explain why the plot requires a correction factof of 22000 seconds. That's off by about 6 hours, which seems strange.
dev.off() # always close your graphics device if you're not using the monitor