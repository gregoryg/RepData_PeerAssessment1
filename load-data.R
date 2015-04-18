library(data.table)
library(ggplot2)
datazipname <- "activity.zip"
datacsvname <- "activity.csv"

if (!file.exists(datacsvname)) {
    unzip(zipfile = datazipname, overwrite=TRUE)
}

gort <- na.omit(read.csv(datacsvname, header = TRUE, colClasses = c("numeric", "Date", "numeric")))
df <- data.frame(steps=gort$steps, date=gort$date)
dt <- data.table(df)
dt <- dt[,list(mean=mean(steps), median=median(steps),sd=sd(steps), tot=sum(steps)), by=date]
