# plot2
library(dplyr)
databl <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
datablsub <- filter(databl, as.Date(databl$Date, format="%d/%m/%Y") == "2007-02-01" | 
                            as.Date(databl$Date, format="%d/%m/%Y") == "2007-02-02")
datntime <- paste(datablsub$Date, datablsub$Time)
datablsub$datime <- strptime(datntime, format="%d/%m/%Y %H:%M:%S")
png(file = "plot2.png")
plot(datablsub$datime, as.numeric(as.character(datablsub$Global_active_power)), 
                             ylab = "Global Active Power (kilowatts)", xlab = "", type = "n")
lines(datablsub$datime, as.numeric(as.character(datablsub$Global_active_power)))
dev.off()