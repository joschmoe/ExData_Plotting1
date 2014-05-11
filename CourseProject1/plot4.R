###Exploratory Data, Peer Asssignment 1

###plot4 code

##load data and check out first 100 rows (hpct2), trial subset for easy of initial 
##analysis(hpct4), add column names found in hpct2 to hpct4

hpct2<-<-read.table("household_power_consumption.txt", sep=";", 
                    header=TRUE, nrow=100)

hpct4<-read.table("household_power_consumption.txt", sep=";", 
                  header=TRUE, skip=66500, nrow=5000)

hpctNames<-names(hpct2)
colnames(hpct4)<-hpctNames

#subset for appropriate dates, then combine with time to get DateTime for analysis
hpct10<-hpct4   ##copy of subset with 5000 rows containing required data
hpct11<-hpct10  ##second copy for tweeking the subset to contain 02/01 and 02/02/2007

hpct10$Date<-as.character(hpct10$Date) ##for easy subsetting
hpctSub11<-subset(hpct11, hpct10$Date=="1/2/2007")
hpctSub21<-subset(hpct11, hpct10$Date=="2/2/2007")
hpctSub<-rbind(hpctSub11, hpctSub21)
hpctSub$Time<-as.character(hpctSub$Time)

##making the DateTime column for analysis
hpctSub$DateTime <- strptime(paste(hpctSub$Date, hpctSub$Time), 
                             format="%d/%m/%Y %H:%M:%S")



##plot4

par(mfrow=c(2,2), cex=0.7)
##top left, Global Active Power over Date Time
plot(hpctSub$DateTime, hpctSub$Global_active_power, xlab="date-time",
     ylab="Global Active Power", type="l", lty=1 )
##top right, Voltage over Date Time
plot(hpctSub$DateTime, hpctSub$Voltage, xlab="date-time",
     ylab="Voltage", type="l", lty=1 )
##bottom left, Energy Sub Metering, 3 variables, over Date Time
plot(hpctSub$DateTime, hpctSub$Sub_metering_1, xlab="date-time",
     ylab="Energy Sub-Metering", type="l", lty=1 ) ##this gives SM1
lines(hpctSub$DateTime, hpctSub$Sub_metering_2, type="l", col="red", lty=1)
lines(hpctSub$DateTime, hpctSub$Sub_metering_3, type="l", col="blue", lty=1)
legend("topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
       lty=1, bty="n", col=c("black", "red", "blue"), cex=0.25 )
##bottom right, Global Reactive Power over Date Time
plot(hpctSub$DateTime, hpctSub$Global_reactive_power, xlab="date-time",
     ylab="Global Reactive Power", type="l", lty=1 )

###Making png file

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(hpctSub$DateTime, hpctSub$Global_active_power, xlab="date-time",
     ylab="Global Active Power", type="l", lty=1 )
plot(hpctSub$DateTime, hpctSub$Voltage, xlab="date-time",
     ylab="Voltage", type="l", lty=1 )
plot(hpctSub$DateTime, hpctSub$Sub_metering_1, xlab="date-time",
     ylab="Energy Sub-Metering", type="l", lty=1 ) ##this gives SM1
lines(hpctSub$DateTime, hpctSub$Sub_metering_2, type="l", col="red", lty=1)
lines(hpctSub$DateTime, hpctSub$Sub_metering_3, type="l", col="blue", lty=1)
legend("topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
       lty=1, bty="n", col=c("black", "red", "blue"), cex=0.75 )
plot(hpctSub$DateTime, hpctSub$Global_reactive_power, xlab="date-time",
     ylab="Global Reactive Power", type="l", lty=1 )
dev.off()