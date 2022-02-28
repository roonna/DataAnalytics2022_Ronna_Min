data(swiss)
sclass <- kmeans(swiss[2:6], 3) 
table(sclass$cluster, swiss[,2])  

# library for naiveBayes
library(e1071)

# -- this was not the problem
# fix colnames
# colnames(swiss) <- c("Fertility", "Agriculture", "Examination", "Education", "Catholic", "InfantMortality")

# changed to [2:6] from [2:7], there is no column 7
m <- naiveBayes(swiss[2:6], swiss[,2])   
table(predict(m, swiss[2:6]))
  # removed 3rd argument, should be threshold if any
