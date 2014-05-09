plot1 <- function()  {
  
  # Open file, store to data, rename columns
  data = read.csv2("household_power_consumption.txt", skip = 66636, nrows = 2880)
  colnames(data) = c("Date", "Time", "GAP", "GRP", "V", "GI", "Sub1", "Sub2", "Sub3")
  
  # Convert columns to numeric/date-time formats
  data$Date = as.Date(data[,1],format="%d/%m/%Y")
  data$Time = as.POSIXlt(sprintf("%s %s", data[,1], data[,2]), format = "%Y-%m-%d %H:%M:%S")
  data$GAP  = as.numeric(as.vector(data$GAP))
  data$GRP  = as.numeric(as.vector(data$GRP))
  data$V    = as.numeric(as.vector(data$V))
  data$GI   = as.numeric(as.vector(data$GI))
  data$Sub1 = as.numeric(as.vector(data$Sub1))
  data$Sub2 = as.numeric(as.vector(data$Sub2))
  data$Sub3 = as.numeric(as.vector(data$Sub3))
  
  # Plot 1
  png(file = "plot1.png", bg = "transparent")
  hist(data$GAP, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
}