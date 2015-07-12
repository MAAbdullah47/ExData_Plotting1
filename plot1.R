
Electric = read.table(file.choose(), header= TRUE, stringsAsFactors=FALSE ,sep=";")
str(Electric)

Electric1 <-Electric[Electric$Date=="1/2/2007" | Electric$Date=="2/2/2007",]
str(Electric1)
png(filename="D:/Coursera/Assignment 1/plot1.png", height=480, width=480, 
    bg="white")
hist(as.numeric(Electric1$Global_active_power), col = "red")
dev.off()
