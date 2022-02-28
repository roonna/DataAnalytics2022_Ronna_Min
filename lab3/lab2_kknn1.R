#compare to kknn?

library(kknn)

# spam doesn't exist
# if spam did exist, specify train & test subsets:
abc <- spam[10:20]
train <- spam[-abc]
test <- spam[abc]

spam.kknn <- kknn(spam~., train, test, distance = 1,
             kernel = "triangular")

summary(spam.kknn)
# etc....
# other distances and kernels!!
