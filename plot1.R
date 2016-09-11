setClass('myDate')
setClass('mynumeric')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
setAs("character","mynumeric", function(from) { 
  as.numeric(from, na.rm = TRUE)
})

df <- read.delim("~/Downloads/Exploratory Data Analysis/household_power_consumption.txt", header= TRUE, sep = ";",
                 colClasses=c("myDate","character","mynumeric", "mynumeric", "mynumeric", "mynumeric", "mynumeric", "mynumeric", "mynumeric"))
start <- as.Date("2007-02-01", format="%Y-%m-%d")
end <- as.Date("2007-02-02", format="%Y-%m-%d")
df <- df[df$Date >= start & df$Date <= end,]

df$DateTime <- paste(df$Date, df$Time)




#Plot 1
hist(df$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Print to PNG file
dev.copy(png, file = "~/Downloads/Exploratory Data Analysis/ExData_Plotting1/plot1.png") 
dev.off() 
