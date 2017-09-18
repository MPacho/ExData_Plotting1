# plot 2
# The script assumes that the working directory is set to the folder containing the 
# household_power_consumption.txt file and the cloned github repository ExData_Plotting1

library(data.table)
library(lubridate)

df <- fread("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
df$DateTime <- dmy_hms(paste(df$Date, df$Time))

with(df, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.copy(png, file="ExData_Plotting1\\plot2.png",  width=480, height=480)
dev.off()