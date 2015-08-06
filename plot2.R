#expect household_power_consumption.txt in the working directory
hpc = read.csv("household_power_consumption.txt", sep = ";", colClasses=c("character","character","numeric","numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),na.strings = "?")

hpc$Time = strptime(paste(hpc$Date,hpc$Time), format='%d/%m/%Y%t%H:%M:%S')
hpc$Date = as.Date(hpc$Date, format='%d/%m/%Y')

hpc2 = hpc[hpc$Date>=as.Date('2007-02-01') & hpc$Date<=as.Date('2007-02-02'),]

png(filename='plot2.png', width=480,height=480)

plot(hpc2$Time, hpc2$Global_active_power, type='l',
     main='', xlab='', ylab='Global Active Power (kilowatts)')

dev.off()