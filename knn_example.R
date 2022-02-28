library(rpart)

dim(iris)

s_iris <- sample(150, 100)
s_iris

iris_train <- iris[s_iris,]
iris_test <- iris[-s_iris,]

dim(iris_train)
dim(iris_test)

dectionTreeModel <- rpart(Species~., iris_train, method = "class")
dectionTreeModel

# plot decision tree
rpart.plot(dectionTreeModel)



# abalone dataset
abalone <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data"), header=FALSE, sep=",")
colnames(abalone) <- c("sex", "length", "diameter", "height", "whole_weight", "shucked_weight", "viscera_weight", "shell_weight", "rings")
summary(abalone)
str(abalone)


summary(abalone$rings)
abalone$rings <- as.numeric(abalone$rings)
abalone$rings <- cut(abalone$rings, br=c(-1, 8, 11, 35), labels=c("young", "adult", "old"))
abalone$rings <- as.factor(abalone$rings)
summary(abalone$rings)


aba <- abalone
aba$sex <- NULL

# normalize adjusts variables so that all are between 0 and 1
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

aba[1:7] <- as.data.frame(lapply(aba[1:7], normalize))
summary(aba$shucked_weight)

# assign everything to either train or test (1 or 2)
ind <- sample(2, nrow(aba), replace=TRUE, prob=c(0.7, 0.3))

KNNtrain <- aba[ind==1,]
KNNtest <- aba[ind==2,]


# sqrt(2918)
library(class)

KNNpred <- knn(train = KNNtrain[1:7], test = KNNtest[1:7], cl = KNNtrain$rings, k=55)
KNNpred

table(KNNpred)
