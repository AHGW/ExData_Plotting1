### This code loads two months data from current directory. 
### Plots the histogram and export it as .png file

library(data.table)
DT<- fread("./household_power_consumption.txt",skip="1/2/2007",nrows=2880)
nam <- fread("household_power_consumption.txt",nrows=1)  # finding column names
setnames(DT,names(nam))     # set solumn names
DT$DateTime <- as.POSIXct(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S")


# df$DateTime <- dmy_hms(paste(df$Date, df$Time))
png(filename = "plot1.png",  width = 480, height = 480, units = "px", bg = "white")
hist(DT$Global_ac,xlab="Global ActivePower (killowatts)", main = "Global Active Power", col=2)
dev.off()
