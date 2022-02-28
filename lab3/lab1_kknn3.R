data(swiss)

pairs(~ Fertility + Education + Catholic, data = swiss, subset = Education < 20, main = "Swiss data, Education < 20")
help("pairs")
# plots matrix of scatterplots
# subset limits data -> data = swiss with Education < 20