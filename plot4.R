Electric = read.table(file.choose(), header= TRUE, stringsAsFactors=FALSE ,sep=";")
str(Electric)
##----> Another Method Of Selecting the Data
Electric1 <- subset(Electric,  Date == "1/2/2007" | Date == "2/2/2007", select = Date: Sub_metering_3)
Electric1
head(Electric1)
max_y <- max(as.numeric(Electric1$Sub_metering_1))
g_range <- range(0, as.numeric(Electric1$Sub_metering_1), as.numeric(Electric1$Sub_metering_2),as.numeric(Electric1$Sub_metering_3))
plot_colors <- c("blue","red","forestgreen")
png(filename="D:/Coursera/Assignment 1/plot4.png", height=480, width=480, 
    bg="white") 
#----> Fitting Multiple Graphes In One Window
par(mfrow=c(2,2), mar=c(2,5,2,1), las=1, bty="n")
plot(as.numeric(Electric1$Global_active_power),xaxt="n",type = "l",ylab = "Global Active Power (killowatts)")
axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
plot(as.numeric(Electric1$Global_reactive_power),xaxt="n",type = "l",ylab = "Global Reactive Power (killowatts)")
axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
plot(as.numeric(Electric1$Voltage),xaxt="n",type = "l",ylab = "Voltage")
axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
#----->
plot(as.numeric(Electric1$Sub_metering_1),xaxt="n",type = "l",col=plot_colors[1], ylab = "Energy Sub Metering")
axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
lines(as.numeric(Electric1$Sub_metering_2),col=plot_colors[2])
#lines(as.numeric(Electric1$Sub_metering_2),type = "l",color="blue")
axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
lines(as.numeric(Electric1$Sub_metering_3),col=plot_colors[3])
axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
legend("topright", names(Electric[7:9]), cex=0.8, col=plot_colors, 
       lty=1:1, lwd=2, bty="n")
dev.off()

