
### This code loads two months data from current directory. 
### Plots three line plots on the same panel and export it as .png file

library(data.table)
DT<- fread("./household_power_consumption.txt",skip="1/2/2007",nrows=2880)
nam <- fread("household_power_consumption.txt",nrows=1)    # finding column names
setnames(DT,names(nam))   # set solumn names
DT$DateTime <- as.POSIXct(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S")


# df$DateTime <- dmy_hms(paste(df$Date, df$Time))
png(filename = "plot3.png",  width = 480, height = 480, units = "px", bg = "white")


with(DT, plot(DateTime, Sub_metering_1,main = " ", type = "n",xlab=" ", ylab= "Energy sub metering"))
with(DT, lines(DateTime, Sub_metering_1))
with(DT, lines(DateTime, Sub_metering_2,col="red"))
with(DT, lines(DateTime, Sub_metering_3,col="blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_1"),lty=1,col = c("black", "red","blue"))

dev.off()
