# plot3
library(dplyr)

databl <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
datablsub <- filter(databl, as.Date(databl$Date, format="%d/%m/%Y") == "2007-02-01" | 
                            as.Date(databl$Date, format="%d/%m/%Y") == "2007-02-02")
datntime <- paste(datablsub$Date, datablsub$Time)
datablsub$datime <- strptime(datntime, format="%d/%m/%Y %H:%M:%S")
png(file = "plot3.png")
plot(datablsub$datime, as.numeric(as.character(datablsub$Sub_metering_1)), 
                             ylab = "Energy sub metering", xlab = "", type = "n")
lines(datablsub$datime, as.numeric(as.character(datablsub$Sub_metering_1)), col = "black")
lines(datablsub$datime, as.numeric(as.character(datablsub$Sub_metering_2)), col = "red")
lines(datablsub$datime, datablsub$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1),  col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                             "Sub_metering_2", "Sub_metering_3"))
dev.off()