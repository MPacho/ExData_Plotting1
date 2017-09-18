# plot 3
# The script assumes that the working directory is set to the folder containing the 
# household_power_consumption.txt file and the cloned github repository ExData_Plotting1

library(data.table)
library(lubridate)

df <- fread("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
df$DateTime <- dmy_hms(paste(df$Date, df$Time))

png(file="ExData_Plotting1\\plot3.png")
with(df, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
lines(df$DateTime, df$Sub_metering_1, col="black")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()