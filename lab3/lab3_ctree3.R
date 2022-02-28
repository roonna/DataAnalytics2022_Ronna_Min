
# create conditional inference tree
fitK <- ctree(Kyphosis ~ Age + Number + Start, data=kyphosis)

# default plot
plot(fitK, main="Conditional Inference Tree for Kyphosis")

# simple plot
# (no graphs for each node)
plot(fitK, main="Conditional Inference Tree for Kyphosis",type="simple")

