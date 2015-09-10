library(lattice)

## Import Data Set ##
dice <- read.csv("dicevalidation.csv")
custom <- read.csv("Chessex.csv")

## Survey Results ##
symbol6 <- 21+57+37
symbol1 <- 11+18+9
symbols <- c(symbol1,symbol6)

## Plot Survey Results ##
barplot(symbols, main="Should a Special Symbol be on the 6 or 1 Facing?",ylab="Respondents",
        names.arg=c("One","Six"),ylim=c(0,120))

## Are the dice fair? ##
#Flames of War - 1st Para
FoWMean <- mean(dice$FoW1Para)
barplot(table(dice$FoW1Para),ylim=c(0,200),main="Flames of War, 1st Para",xlab="Result",ylab="Rolls")
FoWChi <- chisq.test(table(dice$FoW1Para))$p.value

#Your Move Games
YMMean <- mean(dice$YourMove)
barplot(table(dice$YourMove),ylim=c(0,200),main="Your Move Games",xlab="Result",ylab="Rolls")
YMChi <- chisq.test(table(dice$YourMove))$p.value

#GW Rohan
RohanMean <- mean(dice$GWRhohan)
barplot(table(dice$GWRhohan),ylim=c(0,200),main="Games Workshop - Rohan",xlab="Result",ylab="Rolls")
RohanChi <- chisq.test(table(dice$GWRhohan))$p.value

#GW Uruk
UrukMean <- mean(dice$GWUruk)
barplot(table(dice$GWUruk),ylim=c(0,200),main="Games Workshop - Uruk",xlab="Result",ylab="Rolls")
UrukChi <- chisq.test(table(dice$GWUruk))$p.value

#GW 40K
FortyKMean <- mean(dice$GW40K)
barplot(table(dice$GW40K),ylim=c(0,200),main="Games Workshop - 40K",xlab="Result",ylab="Rolls")
FortyKKChi <- chisq.test(table(dice$GW40K))$p.value

# Chessex Dice
ChessexMean <- mean(custom$Custom)
barplot(table(custom$Custom),ylim=c(0,200),main="Custom Chessex",xlab="Result",ylab="Rolls")
ChessexChi <- chisq.test(table(custom$Custom))$p.value