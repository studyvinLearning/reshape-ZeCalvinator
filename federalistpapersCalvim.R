# Calvin Wayne Fertig III


data(federalistPapers, package = 'syllogi')

fedsub <- as.data.frame(federalistPapers[[1]])
federalistPapers[[2]]
"tewst"
fedsub <- rbind(fedsub, federalistPapers[[2]])
fedsub[nrow(fedsub) + 1] <- federalistPapers[[2]]


test2 <- data.frame(do.call(rbind, federalistPapers))
str(test2$meta)
test3 <- data.frame(do.call(rbind, test2$meta))

test3$day <- weekdays(test3$date)
test3$paper <- test2$paper

table(test3$day, test3$author)

newdf <- data.frame(author = test3$author, date = test3$date)
