## Importing dataset: 2,075,259 rows, 9 columns and missing values are coded as ?
dataset <- read.csv("./household_power_consumption.txt", 
                    header=T, sep=';', na.strings="?", nrows=2075259, 
                    check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


## Converting dates and subsetting data:  2007-02-01 and 2007-02-02
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
data_subset <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data_subset$Global_active_power~data_subset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()