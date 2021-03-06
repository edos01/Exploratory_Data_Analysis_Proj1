## Loading downloaded and unziped file in my root directory
file <- "./household_power_consumption.txt"

## Reading and processing the data(.txt file)
powerdata <- read.table(file, header=TRUE, sep=";")
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
df <- powerdata[(powerdata$Date=="2007-02-01") | (powerdata$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

# This plots the "plot4.png" in the Ex_Proj1_Plots folder in root/data folder
plot4 <- function() {
  par(mfrow=c(2,2))
  
  ##plot1
  plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  ##plot2
  plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##plot3
  plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(df$timestamp,df$Sub_metering_2,col="red")
  lines(df$timestamp,df$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes box, cex shrinks the text, spacing added after labels so it renders correctly
  
  #plot4
  plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  #final
  dev.copy(png, file="./data/Ex_Proj1_Plots/plot4.png", width=480, height=480)
  dev.off()
}
plot4()
