## This plots the "plot1.png" in the Ex_Proj1_Plots folder in root/data folder
plot1 <- function() {
  hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="./data/Ex_Proj1_Plots/plot1.png", width=480, height=480)
  dev.off()
}
plot1()
