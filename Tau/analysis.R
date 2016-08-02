# Import packages
library(vioplot)

results <- read.csv("trimmed.csv")

# Overall Numbers of Each Army
counts <- table(results$Army)
barplot(counts, main="Army Frequency", 
        xlab="Army",ylim=c(0,20),cex.names=0.80)

# Make Data Sets for Each Army
BA <- subset(results, Army=="BA")
CSM <- subset(results, Army=="CSM")
DA <- subset(results, Army=="DA")
CD <- subset(results, Army=="CD")
Eld <- subset(results, Army=="Eldar")
AM <- subset(results, Army=="AM")
Nec <- subset(results, Army=="Necrons")
O <- subset(results, Army=="Orks")
SM <- subset(results, Army=="SM")
SoB <- subset(results, Army=="SoB")
SW <- subset(results, Army=="SW")
Tau <- subset(results, Army=="Tau")
Nids <- subset(results, Army=="Nids")
IK <- subset(results, Army=="IK")
KDK <- subset(results, Army=="KDK")
Mec <- subset(results, Army=="Mech")

overallmedian <- median(results$Corrected)

vioplot(BA$Corrected,CD$Corrected,Mec$Corrected,CSM$Corrected,DA$Corrected,Eld$Corrected,
        AM$Corrected,IK$Corrected,KDK$Corrected,Nec$Corrected,Nids$Corrected,O$Corrected,
        SM$Corrected, SoB$Corrected,SW$Corrected,Tau$Corrected,col="Grey",drawRect="False", 
        names=c("BA","CD","Mech","CSM","DA","Eldar","AM","IK","KDK",
                "Nec","Nid","Ork","SM","SoB","SW","Tau")
)

title(xlab="Army",ylab="Total Score")
abline(h=overallmedian,col="red3",lwd=3,lty=2)
legend("topright",c("Overall Median"),lwd=3,col=c("Red3"),lty=c(2),bty='n')

Taufit<- glm(Corrected ~ Tau, family=poisson(link=log), data=results)
summary(Taufit)

Eldarfit<- glm(Corrected ~ Eldar, family=poisson(link=log), data=results)
summary(Eldarfit)

SMfit<- glm(Corrected ~ SM, family=poisson(link=log), data=results)
summary(SMfit)

Necfit<- glm(Corrected ~ Necrons, family=poisson(link=log), data=results)
summary(Necfit)

CDfit<- glm(Corrected ~ CD, family=poisson(link=log), data=results)
summary(CDfit)

AMfit<- glm(Corrected ~ AM, family=poisson(link=log), data=results)
summary(AMfit)