require(rpart)
Swiss_rpart <- rpart(Fertility ~ Agriculture + Education + Catholic, data = swiss)

# default plot
plot(swiss_rpart) # try some different plot options
text(swiss_rpart) # try some different text options

