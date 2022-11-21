# x<-c(1,2,3,4,5,6,7,8,9,10)
# y<-c(11,12,13,14,15,16,17,18,19,20)
# 
# data<-list(col1=x,col2=y)
# data
# 
# as.data.frame(data)
# relation<-lm(data$col2~data$col1)
# 
# plot(y,x,abline(lm(x~y)),xlab="X_AXIS",ylab="Y_AXIS")
# ans<-predict(relation,data[])
# ans

library(ggplot2)
library(dplyr)

data<-read.csv("C:/Users/agams/OneDrive/Desktop/Sem7/DSC Lab/income.data.csv")
summary(data)
head(data)
plot(happiness~income,data)

linear.regression<-lm(happiness~income,data)
summary(linear.regression)

income.graph<-ggplot(data,aes(x=income,y=happiness))+geom_point()
income.graph
income.graph<-income.graph+geom_smooth(method="lm")
income.graph

predict(linear.regression,data.frame(income=c(1,2,3)))