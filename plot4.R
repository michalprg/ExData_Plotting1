#expect household_power_consumption.txt in the working directory
hpc = read.csv("household_power_consumption.txt", sep = ";", colClasses=c("character","character","numeric","numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),na.strings = "?")

hpc$Time = strptime(paste(hpc$Date,hpc$Time), format='%d/%m/%Y%t%H:%M:%S')
hpc$Date = as.Date(hpc$Date, format='%d/%m/%Y')

hpc2 = hpc[hpc$Date>=as.Date('2007-02-01') & hpc$Date<=as.Date('2007-02-02'),]

png(filename='plot4.png', width=480,height=480)

par(mfrow=c(2,2))

plot(hpc2$Time, hpc2$Global_active_power, type='l',
     main='', xlab='', ylab='Global Active Power')

plot(hpc2$Time, hpc2$Voltage, type='l',
     main='', xlab='datetime', ylab='Voltage')

plot(hpc2$Time, hpc2$Sub_metering_1, type='n',xlab='', ylab='Energy sub metering')
lines(hpc2$Time, hpc2$Sub_metering_1, type='l')
lines(hpc2$Time, hpc2$Sub_metering_2, type='l', col='red')
lines(hpc2$Time, hpc2$Sub_metering_3, type='l', col='blue')
legend("topright", c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=c(1,1),  bty = "n",
       col=c('black', 'red', 'blue'))

plot(hpc2$Time, hpc2$Global_reactive_power, type='l',
     main='', xlab='datetime', ylab='Global_reactive_power'

dev.off()