#expect household_power_consumption.txt in the working directory
hpc = read.csv("household_power_consumption.txt", sep = ";", colClasses=c("character","character","numeric","numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),na.strings = "?")

hpc$Time = strptime(paste(hpc$Date,hpc$Time), format='%d/%m/%Y%t%H:%M:%S')
hpc$Date = as.Date(hpc$Date, format='%d/%m/%Y')

hpc2 = hpc[hpc$Date>=as.Date('2007-02-01') & hpc$Date<=as.Date('2007-02-02'),]

png(filename='plot3.png', width=480,height=480)

plot(hpc2$Time, hpc2$Sub_metering_1, type='n',xlab='', ylab='Energy sub metering')
lines(hpc2$Time, hpc2$Sub_metering_1, type='l')
lines(hpc2$Time, hpc2$Sub_metering_2, type='l', col='red')
lines(hpc2$Time, hpc2$Sub_metering_3, type='l', col='blue')
legend("topright", c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=c(1,1), 
       col=c('black', 'red', 'blue'))

dev.off()