# plot 4
# The script assumes that the working directory is set to the folder containing the 
# household_power_consumption.txt file and the cloned github repository ExData_Plotting1

library(data.table)
library(lubridate)

df <- fread("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
df$DateTime <- dmy_hms(paste(df$Date, df$Time))


png(file="ExData_Plotting1\\plot4.png")
par(mfrow=c(2,2))
with(df, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(df, plot(DateTime, Voltage, type="l", xlab="datetime"))
with(df, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
lines(df$DateTime, df$Sub_metering_1, col="black")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(df, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))
dev.off()