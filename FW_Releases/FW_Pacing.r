library(survival)
library(vioplot)
library(Hmisc)

FW <- read.csv("FW.csv", header=TRUE)

# Overall time to next release
vioplot(FW$t,names=c("Overall"),col="Grey",drawRect=FALSE)
title("Overall Time to Next Release", ylab="Months")

overall <- survfit(Surv(FW$t,FW$released)~1)
plot(overall, xlab="Months", ylab="Proportion",lwd=c(3,1,1),col=c("darkred","grey30","grey30"))
legend("topright", c("Kaplan-Meier Estimate","95% CI"), lwd=2, col=c("darkred","grey30"),
       lty=c(1,2), bty='n', cex=1)

# Time to next release HH vs. Not
HHyes <- FW[which(FW$HH==1),]
HHno <- FW[which(FW$HH==0),]

vioplot(HHyes$t,HHno$t,names=c("Horus Heresy","Imperial Armour"),col="Grey",drawRect=FALSE)
title("Time to Next Release: Horus Heresy vs. IA", ylab="Months")

HH <- survfit(Surv(FW$t,FW$released)~FW$HH)
plot(HH, xlab="Months", ylab="Proportion",lwd=c(3,3),lty=c(1,2),col=c("darkred","darkblue"))
legend("topright", c("Imperial Armour","Horus Heresy"), lwd=2, col=c("darkred","darkblue"),
       lty=c(1,2), bty='n', cex=1)

# Time to next release, HH era vs. Older, excluding actual HH releases
HHera <- FW[which(FW$era==1),]
early <- FW[which(FW$era==0),]

vioplot(early$t,HHera$t,names=c("Pre-HH","Post-HH"),col="Grey",drawRect=FALSE)
title("Time to Next Release: Post vs. Pre-HH", ylab="Months")

era_edit <- FW[which(FW$era<2),]
era <- survfit(Surv(era_edit$t,era_edit$released)~era_edit$era)
plot(era, xlab="Months", ylab="Proportion",lwd=c(3,3),lty=c(1,2),col=c("darkred","darkblue"))
legend("topright", c("Pre-HH","Post-HH"), lwd=2, col=c("darkred","darkblue"),
       lty=c(1,2), bty='n', cex=1)

# Time to next release, Linked vs. Not
linked <- FW[which(FW$linked==1),]
unlinked <- FW[which(FW$linked==0),]

vioplot(linked$t,unlinked$t,names=c("Linked","Unlinked"),col="Grey",drawRect=FALSE)
title("Time to Next Release: Linked vs. Unlinked Books", ylab="Months")

link <- survfit(Surv(FW$t,FW$released)~FW$linked)
plot(link, xlab="Months", ylab="Proportion",lwd=c(3,3),lty=c(1,2),col=c("darkred","darkblue"))
legend("topright", c("Unlinked","Linked"), lwd=2, col=c("darkred","darkblue"),
       lty=c(1,2), bty='n', cex=1)

# Time to Obsolesence
obs <- read.csv("FW_obsolete.csv", header=TRUE)
a <- Surv(obs$t, obs$obsolete, type='right')
obsolete <- survfit(a~1)
plot(obsolete,mark.time=TRUE,lwd=c(3,0,0),col="darkred",
     xlab="Months",ylab="Proportion of Books",mark=19)
minor.tick(nx=2, ny=2, tick.ratio=1)
abline(v=31,lwd=3,lty=2,col="darkblue")
legend("topright",c("Time to Obsolescence","Median"), lwd=2, col=c("darkred","darkblue"),
       lty=c(1,2), bty='n', cex=1)

obs <- read.csv("FW_obsolete.csv", header=TRUE)
b <- Surv(obs$t, obs$obsolete, type='right')
obsolete2 <- survfit(b~obs$ig)
plot(obsolete2,mark.time=TRUE,lwd=c(3,3),col=c("darkred","darkblue"),
     xlab="Months",ylab="Proportion of Books",mark=19)
minor.tick(nx=2, ny=2, tick.ratio=1)
legend("topright",c("Non-IG","IG"), lwd=2, col=c("darkred","darkblue"),
       lty=c(1,1), bty='n', cex=1)
