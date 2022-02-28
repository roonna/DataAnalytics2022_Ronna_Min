require(rpart)
Swiss_rpart <- rpart(Fertility ~ Agriculture + Education + Catholic, data = swiss)
plot(Swiss_rpart) # try some different plot options
text(Swiss_rpart) # try some different text options
# text gets cut off at top & bottom

require(party)

# conditional inference tree
# species based on conditionals for petal.length & width
treeSwiss<-ctree(Species ~ ., data=iris)
plot(treeSwiss)

# random forest
cforest(Species ~ ., data=iris, controls=cforest_control(mtry=2, mincriterion=0))


# ctree for swiss data
treeFert<-ctree(Fertility ~ Agriculture + Education + Catholic, data = swiss)
plot(treeFert)

cforest(Fertility ~ Agriculture + Education + Catholic, data = swiss, controls=cforest_control(mtry=2, mincriterion=0))
# look at help info, vary parameters.

library(tree)
tr <- tree(Species ~ ., data=iris)
tr

# view tr
tr$frame
plot(tr)
text(tr)


#find "prettier" ways to plot the tree
# used rpart plot !
library("rpart")
library("rpart.plot")
rpart_tr <- rpart(Species ~ ., data=iris)
rpart.plot(rpart_tr)


