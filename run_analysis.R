this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)
dataset <- function () {
     fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     download.file(fileurl, destfile="./data.zip", method="curl")
     system("unzip -d ./ ./data.zip")
     system("mv ./'UCI HAR Dataset'/* ./")
     system("rm -r ./'UCI HAR Dataset'")
     system("rm -r ./data.zip")
}
groupdf <- function (groupname) {
     path <- gsub("-name-", groupname, "./-name-/X_-name-.txt")
     x <- read.table(path)
     features <- read.table('./features.txt')
     names(features) <- c('index', 'name')
     selectmean <- with(features, grepl("mean\\(\\)", name))
     selectstd <- with(features, grepl("std\\(\\)", name))
     meanstddf <- features[selectmean | selectstd, ]
     x <- x[, meanstddf$index]
     names(x) <- meanstddf$name
     path <- gsub("-name-", groupname, "./-name-/y_-name-.txt")
     y <- read.table(path)
     names(y) <- c('short')
     activity_labels <- read.table('./activity_labels.txt')
     names(activity_labels) <- c('short', 'long')
     activity_long <- merge(activity_labels, y)$long
     path <- gsub("-name-", groupname, "./-name-/subject_-name-.txt")
     subject_df <- read.table(path)
     names(subject_df) <- c('subjectid')
     final_df <- cbind(subject_df, activity_long, x)
     final_df$groupname <- groupname
     final_df
}
final <- function() {
     train_df <- groupdf('train')
     test_df <- groupdf('test')
     final_df <- rbind(train_df, test_df)
     write.csv(file='./complete.csv', x=final_df)
     library(plyr)
     group_columns = c("subjectid", "activity_long")
     final_names <- names(final_df)
     data_columns = final_names[3:68]
     simple_df <- ddply(final_df, group_columns, function(x) colMeans(x[data_columns]))
     write.table(row.name = FALSE, file = './simple.txt', sep = ";", x=simple_df)
}
dataset()
final()
