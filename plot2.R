Electric = read.table(file.choose(), header= TRUE, stringsAsFactors=FALSE ,sep=";")
str(Electric)

Electric1 <-Electric[Electric$Date=="1/2/2007" | Electric$Date=="4/2/2007",]
str(Electric1)

hist(as.numeric(Electric1$Global_active_power), col = "red")

library(lubridate)
Electric1$Date <- as.Date(Electric1$Date)
wday(Electric1$Date,label=TRUE)
png(filename="D:/Coursera/Assignment 1/plot2.png", height=480, width=480, 
    bg="white")

#plot(as.numeric(Electric1$Global_active_power)~wday(Electric1$Date,label=TRUE),type="l",color="red")

#plot(wday(Electric1$Date,label=TRUE), as.numeric(Electric1$Global_active_power), xlab= "Week Days", ylab= "Global Active Power", type='l', col='red') 

plot(as.numeric(Electric1$Global_active_power),xaxt="n",type = "l",ylab = "Global Active Power (killowatts)")
axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
dev.off()
##----> Another Method Of Selecting the Data
required_data <- subset(Electric,  Date == "1/2/2007" | Date == "2/2/2007", select = Date: Sub_metering_3)
required_data
head(required_data)
##----> End Another Method Of Selecting the Data
