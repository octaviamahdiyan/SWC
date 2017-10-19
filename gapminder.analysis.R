cats <- read.csv("data/cat.csv")
mean(cats$weight)
as.logical(cats$like_string)
cats$like_string
cats[1,1]
class(cats$coat)
names(cats)
names(cats)[1] <- "coats"
names(cats)
nrow(cats)
ncol(cats)
dim(cats)
