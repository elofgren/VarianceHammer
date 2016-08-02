Traffic <- read.csv("~/Documents/Code/VarianceHammer/Two Years/Traffic.csv", header=FALSE)

barplot(Traffic$V2, names.arg=c("Search","Reddit","Facebook","Dakka","BoLS BR","RPG.net","BoLS","BaCS","Twitter","ICs","FLG","Other BR"),xlab="Site",ylab="Views")

views <- read.csv("Views.csv")

plot(views$Month,views$Views,xlab="Months",ylab="Views")
fit <- lm(views$Views ~ views$Month)
lines(fitted(fit),col="Red3",lwd=3)


plot(views$Month,views$Views,xlab="Months",ylab="Views")
segments(0,1125.83,12,1125.83,col="blue",lwd=3)
segments(13,7771.23,26,7771.23,col="red3",lwd=3)
legend("topleft", c("Year 1","Year 2+"), lwd=3, 
       col=c("blue","red3"),lty=c(1,1), bty='n', cex=1.25)