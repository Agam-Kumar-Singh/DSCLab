library(arules)
library(arulesViz)

dataset = read.transactions('C:/Users/agams/OneDrive/Desktop/Sem7/DSC Lab/Kartikeya R/Market_Basket_Optimisation.csv')
model<-apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))
itemFrequencyPlot(dataset, topN = 10)
inspect(sort(model, by = 'lift')[1:10])
plot(model, method = "graph",measure = "confidence", shading = "lift")
