###Exploratory Data, Peer Asssignment 1

###plot1 code

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



##plot1: Histogram of Global Active Power (Frequencies)

par(mar=c(4,4,2,1), cex=0.75)
hist(hpctSub$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col="red")



###Making png file

png(file="plot1.png", width=480, height=480)
par(mar=c(4,4,2,1))
hist(hpctSub$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col="red")
dev.off()

