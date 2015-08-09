## Importing dataset: 2,075,259 rows, 9 columns and missing values are coded as ?
dataset <- read.csv("./household_power_consumption.txt", 
                    header=T, sep=';', na.strings="?", nrows=2075259, 
                    check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


## Converting dates and subsetting data:  2007-02-01 and 2007-02-02
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
data_subset <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)

## Plot 3
with (data_subset, 
     {plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
      lines(Sub_metering_2~Datetime,col='Red')
      lines(Sub_metering_3~Datetime,col='Blue')}
      )
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, xpd , inset = 0, cex = 0.5, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()