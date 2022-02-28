nyt1<-read.csv("../datasets/nyt1.csv") # adjust filepath
# dataset with people: age, gender, impressions, clicks, signed_in

nyt1<-nyt1[which(nyt1$Impressions>0 & nyt1$Clicks>0 & nyt1$Age>0),]
# filter to get only people who have impressions & clicks (& valid age)

nnyt1<-dim(nyt1)[1]		# shrink it down!
# 22062

sampling.rate=0.9
num.test.set.labels=nnyt1*(1.-sampling.rate)

# set train/test subsets
training <-sample(1:nnyt1,sampling.rate*nnyt1, replace=FALSE)
train<-subset(nyt1[training,],select=c(Age,Impressions))
testing<-setdiff(1:nnyt1,training)
test<-subset(nyt1[testing,],select=c(Age,Impressions))

# select subsets in gender data
cg<-nyt1$Gender[training]
true.labels<-nyt1$Gender[testing]

library(class) # need class library for knn
classif<-knn(train,test,cg,k=5)
classif
attributes(.Last.value) 

