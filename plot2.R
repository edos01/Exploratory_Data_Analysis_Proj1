## This plots the "plot2.png" in the Ex_Proj1_Plots folder in root/data folder
plot2 <- function() {
  plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file="./data/Ex_Proj1_Plots/plot2.png", width=480, height=480)
  dev.off()
}
plot2()
