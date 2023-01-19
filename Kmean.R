libray("ggplot2")
library("caTools")
library("ggfortify")

head(iris)
data<-subset(iris,select=c(1,2,3,4))

wss<-(nrow(data)-1)*(sum(apply(data,2,var)))
for (i in 2 :15){
  wss[i]<-sum(kmeans(data,centers = i)$withinss)
}
plot(1:15,wss,type="b",xlab="WSS",ylab="Number")
wss

kmean<-kmeans(data,2)
kmean$centers

autoplot(kmean,data,frame=TRUE)
library(cluster)
clusplot(data,kmean$cluster)
