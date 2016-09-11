setClass('myDate')
setClass('mynumeric')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
setAs("character","mynumeric", function(from) { 
  as.numeric(from, na.rm = TRUE)
})

## Read the entire data 
## Keep the time column Class to character, we will merge Date+Time later 
## Set columClass as Date
df <- read.delim("~/Downloads/Exploratory Data Analysis/household_power_consumption.txt", header= TRUE, sep = ";",
                 colClasses=c("myDate","character","mynumeric", "mynumeric", "mynumeric", "mynumeric", "mynumeric", "mynumeric", "mynumeric"))
start <- as.Date("2007-02-01", format="%Y-%m-%d")
end <- as.Date("2007-02-02", format="%Y-%m-%d")

## Subset the data frame to tge desired dates, i.e. >= start and  <= end.
df <- df[df$Date >= start & df$Date <= end,]

##merge Date and Time 
df$DateTime <-  strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")


#Plot4
par(mfrow=c(2,2), mar=c(4,4,2,1))

plot(df$DateTime, df$Global_active_power, type="l", ylab = "Global Active Power", xlab = " ")

plot(df$DateTime, df$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

with(df, plot(DateTime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = " "))
with(df, points(DateTime, Sub_metering_2, type="l", col = "red"))
with(df, points(DateTime, Sub_metering_3, type="l", col ="blue"))
legend("topright", lwd = 1, box.lwd = 0, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.width = strwidth("Sub_metering_3                    "))

plot(df$DateTime, df$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file = "~/Downloads/Exploratory Data Analysis/plot4.png") 
dev.off() 


#Print to PNG file
dev.copy(png, file = "~/Downloads/Exploratory Data Analysis/ExData_Plotting1/plot4.png") 
dev.off() 



