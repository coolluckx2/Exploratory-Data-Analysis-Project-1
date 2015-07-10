# reading  and  making subset data 
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


# plot graph
hist(subdata$Global_active_power, col="red", main="Global active power", xlab="Global active power(kilowatts)", ylab="Frequency")


# save as png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()