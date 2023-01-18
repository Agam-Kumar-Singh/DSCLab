library(dplyr)
library(ggplot2)

head(mtcars)
colnames(mtcars)
dim(mtcars)

#Distance Matrix:
dist_matrix<-dist(mtcars,method="euclidean")
dist_matrix


#Model

hclust_model<-hclust(dist_matrix,method="average")
summary(hclust_model)

plot(hclust_model)

fit<-cutree(hclust_model,k=3)
fit
table(fit)
rect.hclust(hclust_model,k=3,border="green")


