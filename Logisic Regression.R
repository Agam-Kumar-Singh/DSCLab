library(caTools)
data<-read.csv('C:/Users/agams/OneDrive/Desktop/Sem7/DSC Lab/Titanic.csv')

head(data)

summary(data)
colnames(data)

data<-subset(data,select=c(2,3,5,6,12))

summary(data)

data$Age[is.na(data$Age)]<-mean(data$Age,na.rm=T)
data$Sex<-as.numeric(factor(data$Sex))
data$Embarked<-as.numeric(factor(data$Embarked))
head(data)

summary(data)

split<-sample.split(data,SplitRatio = 0.7)
training<-subset(data,split==TRUE)
test<-subset(data,split==FALSE)

model<-glm(Survived~.,family=binomial(link="logit"),training)
summary(model)

library(ROCR)
p<-predict(model,newdata = subset(test,select=c(2,3,4,5)))
pr<-prediction(p,test$Survived)
pr

prf<-performance(pr,"tpr","fpr")
plot(prf)

auc<-performance(pr,"auc")
auc<-auc@y.values[[1]]
auc


