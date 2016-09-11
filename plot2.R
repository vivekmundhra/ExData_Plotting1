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


#Plot2
plot(df$DateTime, df$Global_active_power, type="l",  ylab = "Global Active Power (kilowatts)", xlab = " ")


#Print to PNG file
dev.copy(png, file = "~/Downloads/Exploratory Data Analysis/ExData_Plotting1/plot2.png") 
dev.off() 



