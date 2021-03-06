# reading  and  making subset data 
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## adding values
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$datetime <- as.POSIXct(datetime)


# plot graph
plot(subdata$Global_active_power~subdata$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


# save as png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()