# plot1
library(dplyr)
databl <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
datablsub <- filter(databl, as.Date(databl$Date, format="%d/%m/%Y") == "2007-02-01" | 
                            as.Date(databl$Date, format="%d/%m/%Y") == "2007-02-02")
png(file = "plot1.png")
hist(as.numeric(as.character(datablsub$Global_active_power)), col = "red", main = "Global Active Power", 
                            xlab = "Global Active Power (kilowatts)")
dev.off()