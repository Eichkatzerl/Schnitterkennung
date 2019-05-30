library(R.matlab)
setwd('C:\\Users\\hannes\\Dropbox\\Uni\\Mustererkennung\\Projekt\\Schnittprogramm')
cuts <- readMat('cuts.mat')
cuts <- unlist(cuts, use.names = F)


nocuts <- readMat('nocuts.mat')
nocuts <- unlist(nocuts, use.names = F)

data <- data.frame(c(cuts, nocuts), c(rep('cut',length(cuts)),rep('nocut',length(nocuts))))
colnames(data) <- c('SAD','isCut')

res <- aov(formula = SAD~isCut, data = data)
summary(res)
