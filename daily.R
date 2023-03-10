library(ggplot2)
library(dplyr)
expenses <- read.csv("dailyexpenses.csv")
View(expenses)
str(expenses)
expenses$Date <- as.Date(expenses$Date,"%d /%m/ %y")
View(expenses)
tot <- expenses[,2:9]
total <- colSums(tot)
detail <- c("Food","Groceries","Medical","Fuel","toll","Phone","Electricity","Miscellaneous")
tot_each <- data.frame(detail,total)
View(tot_each)
ggplot(data=tot_each,aes(x=detail,y=total))+
  geom_bar(stat = "identity", fill ="black")+
  labs(x="items",y="expenses",title="comparing expenses")
cm <- expenses[,2:9]
dt <- expenses[,1]
rs <- rowSums(cm)

daily_tot <- data.frame(dt,rs)
View(daily_tot)

ggplot(data=daily_tot,aes(x=dt, y=rs)) +geom_line(color="red",size=1) + labs(x="Date",y="Expenses",title="Total Expenses")

md <- expenses[,3]
de <- expenses[,1]
daily_med <- data.frame(de,md)
View(daily_med)
ggplot(data=daily_med,aes(x=de,y=md)) + geom_point() + labs(x= "Expenses", y="Medical",title = "Medical Expenses")

ggplot(expenses,aes(x=Medical)) +
  geom_histogram(binwidth = 5, color ="black",fill = "blue")
pc <- read.csv('piechart.csv')
View(pc)

pie <- ggplot(pc,aes(x="",y=amount,fill= factor(expense))) +
  geom_bar(width = 1, stat ="identity") +
  theme(axis.line = element_blank(), 
        plot.title = element_text(hjust = 0.5)) +
  labs(fill = "expense", x =  NULL, y =NULL, title = "Pie Chart of expenses")
pie + coord_polar(theta = "y", start=0)