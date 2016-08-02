# Import packages
library(vioplot)

LVO <- read.csv("LVO2016.csv")

# Overall Numbers of Each Army
counts <- table(LVO$Army)
barplot(counts, main="Army Frequency", 
        xlab="Army",ylim=c(0,50),cex.names=0.80)

# Make Data Sets for Each Army
BA <- subset(LVO, Army=="BA")
CSM <- subset(LVO, Army=="CSM")
DA <- subset(LVO, Army=="DA")
CD <- subset(LVO, Army=="CD")
DE <- subset(LVO, Army=="DE")
Eld <- subset(LVO, Army=="Eld")
GK <- subset(LVO, Army=="GK")
IG <- subset(LVO, Army=="IG")
Nec <- subset(LVO, Army=="Nec")
O <- subset(LVO, Army=="Orks")
SM <- subset(LVO, Army=="SM")
SoB <- subset(LVO, Army=="SoB")
SW <- subset(LVO, Army=="SW")
Tau <- subset(LVO, Army=="Tau")
Nids <- subset(LVO, Army=="Nids")
IK <- subset(LVO, Army=="IK")
Inq <- subset(LVO, Army=="][")
KDK <- subset(LVO, Army=="KDK")
Harl <- subset(LVO, Army=="Harl")
Mec <- subset(LVO, Army=="CM")
Skit <- subset(LVO, Army=="Ski")
Ren <- subset(LVO, Army=="Ren")

overallmedian <- median(LVO$Total)

vioplot(Inq$Total,BA$Total,CD$Total,Mec$Total,CSM$Total,DA$Total,DE$Total,Eld$Total,GK$Total,Harl$Total,
        IG$Total,IK$Total,KDK$Total,Nec$Total,Nids$Total,O$Total,Ren$Total,
        Skit$Total,SM$Total, SoB$Total,SW$Total,Tau$Total,col="Grey",drawRect="False", 
        names=c("][","BA","CD","CM","CSM","DA","DE","Eld","GK", "Har","IG","IK","KDK",
        "Nec","Nid","Ork","Ren","Ski","SM","SoB","SW","Tau")
        )

title(xlab="Army",ylab="Total Score")
abline(h=overallmedian,col="red3",lwd=3,lty=2)
legend("topright",c("Overall Median"),lwd=3,col=c("Red3"),lty=c(2),bty='n')

OverallTest <- kruskal.test(LVO$Total,LVO$Army)

vioplot(Inq$Bonus,BA$Bonus,CD$Bonus,Mec$Bonus,CSM$Bonus,DA$Bonus,DE$Bonus,Eld$Bonus,GK$Bonus,Harl$Bonus,
        IG$Bonus,IK$Bonus,KDK$Bonus,Nec$Bonus,Nids$Bonus,O$Bonus,Ren$Bonus,
        Skit$Bonus,SM$Bonus, SoB$Bonus,SW$Bonus,Tau$Bonus,col="Grey",drawRect="False", 
        names=c("][","BA","CD","CM","CSM","DA","DE","Eld","GK", "Har","IG","IK","KDK",
                "Nec","Nid","Ork","Ren","Ski","SM","SoB","SW","Tau")
)

bonusmedian <- median(LVO$Bonus)
title(xlab="Army",ylab="Bonus Score")
abline(h=bonusmedian,col="red3",lwd=3,lty=2)
legend("topright",c("Overall Median"),lwd=3,col=c("Red3"),lty=c(2),bty='n')

## Clubs
percent_clubs <- mean(LVO$Team)
ClubNo <- subset(LVO, Team==0)$Total
ClubYes <- subset(LVO, Team==1)$Total
ClubNoMedian <- median(ClubNo)
ClubYesMedian <- median(ClubYes)
ClubTest <- kruskal.test(LVO$Total,LVO$Team)
vioplot(ClubYes,ClubNo,names=c("Club Players","Unaffiliated Players"),col="Grey",drawRect=FALSE)
title(xlab="Club Membership",ylab="Total Score")