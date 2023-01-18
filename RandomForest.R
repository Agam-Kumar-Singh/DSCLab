library(randomForest)
library(caTools)
  

head(iris)

split<-sample.split(SplitRatio = 0.7)

train<-subset(iris,split==TRUE)
test<-subset(iris,split==FALSE)

input<-train[,1:4]
target<-train[,5]

model<-randomForest(input,target,ntree=500)

pred<-predict(model,test)
pred

cm<-table(pred,test$Species)
cm

plot(model)
varImpPlot(model)
summary(model)
importance(model)
