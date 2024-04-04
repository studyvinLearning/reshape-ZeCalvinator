#Calvin Fertig


blood <- readRDS("bloodPressure.RDS")
names <- names(blood)[2:length(names(blood))]
test <-reshape(blood,direction =  'long', varying = names, 
               v.names = 'num', idvar = "person"
               , timevar = 'group')

test <-tidyr::pivot_longer(blood, cols = names,
                    names_to = "test",
                    values_to = 'Pressure')
library(tidyr)
test2 <- separate(test, col = test, into = c("test", "date"), sep = " ")
test2$date <- as.Date(as.character(test2$date), "%Y-%b-%d")
test2$day <- weekdays(test2$date)

bloodPbyDay <- aggregate(Pressure ~ day + , test2, mean)
