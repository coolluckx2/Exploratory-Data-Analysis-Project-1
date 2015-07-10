# reading  and  making subset data 
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## adding values
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$datetime <- as.POSIXct(datetime)


## ploting and save png file
png("plot3.png", width=480, height=480)


plot(subdata$Sub_metering_1~subdata$datetime, type="l",
     ylab="Energy sub metering", xlab="")
  points(subdata$Sub_metering_2~subdata$datetime, type="l",
       ylab="Energy sub metering", xlab="", col="red")
  points(subdata$Sub_metering_3~subdata$datetime, type="l",
       ylab="Energy sub metering", xlab="", col="blue")
legend("topright", lty=1, lwd=2, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()


