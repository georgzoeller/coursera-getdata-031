

checkDependencies <- function(deps)
{
  print('Checking dependencies...')
  missingDeps <- deps[!(deps %in% installed.packages()[,"Package"])]
  if(length(missingDeps)) install.packages(missingDeps)
}


# Used seperator char
samsung.SEP = ""

# Output file
samsung.output.summary             <- "./tidy-summary.txt"     #Tidy Summary Dataset


# Header Replacement rules for gsub to create more descriptive variable names

samsung.headerRules <-c ('Acc:accelleration', 
                         'arCoeff:autoRegressionCoefficients',
                         'Freq:frequency', 
                         'Gyro:gyroscope', 
                         'sma:signalMagnitudeArea',
                         'iqr:interquartileRange',
                         'maxIndx:maxFrequencyMagnitudeIndex',
                         'mad:medialAbsoluteDeviation',
                         'Mag:magnitude ',
                         'angle:angle',
                         'std:standard',
                         '^t:timeDomainMeasure',
                         "^f:fastFourierTransform"
)



PACKAGE_DEPS <- c("plyr", "gdata", "dplyr")
checkDependencies(PACKAGE_DEPS)

print(cat('Loading Libraries:', PACKAGE_DEPS))
library("plyr")
library("gdata")  
library("dplyr")


# read data
samsung.set.test.length  <-  nrow(read.csv("./test/X_test.txt", header=F,sep = samsung.SEP))
samsung.set.train.length <- nrow(read.csv("./train/X_train.txt", header=F,sep = samsung.SEP))


print('Reading Data Files...')

samsung.features     <- read.csv("./features.txt", header=F, sep = samsung.SEP)
samsung.activity_names     <- read.csv("./activity_labels.txt" , header=F,sep = samsung.SEP, stringsAsFactors=F)


print('Tidying Column Names...')
samsung.columnNames = samsung.features[,2]

# Replace abreviations with human readable names
for (rule in samsung.headerRules)
{
  spl <- unlist(strsplit(rule, ":"))
  samsung.columnNames <- gsub(spl[1],spl[2], samsung.columnNames)
} 

# Who had the idea of using spaces in column names. collapse.
samsung.columnNames                 <- gsub("[ ]+"," ", gsub("[ ]+$", "", gsub( "[(),-]" , " " , samsung.columnNames)))


# read the actual data (a seecond time)
samsung.set.train                   <- read.csv("./train/X_train.txt", header=F,sep = samsung.SEP, col.names=samsung.columnNames, check.names=T, colClasses="numeric", nrows=samsung.set.train.length)
samsung.labels.train                <- read.csv("./train/y_train.txt", header=F,sep = samsung.SEP, col.names=c("activity_name"), nrows=samsung.set.train.length)
samsung.labels.train$activity_name  <- mapvalues(samsung.labels.train[,1], samsung.activity_names[,1], samsung.activity_names[,2])
samsung.set.train.rownames          <- read.csv("./train/subject_train.txt", header=F,sep = samsung.SEP, nrows=samsung.set.train.length, col.names=c("subject"))

samsung.set.test                    <- read.csv("./test/X_test.txt",  header=F, sep = samsung.SEP, nrows=samsung.set.test.length,  col.names=samsung.columnNames, check.names=T, colClasses="numeric")
samsung.labels.test                 <- read.csv("./test/y_test.txt"  , header=F,sep = samsung.SEP, nrows=samsung.set.test.length,  col.names=c("activity_name"))
samsung.labels.test$activity_name   <- mapvalues(samsung.labels.test[,1], samsung.activity_names[,1], samsung.activity_names[,2])
samsung.set.test.rownames           <- read.csv("./test/subject_test.txt" , header=F,sep = samsung.SEP, nrows=samsung.set.test.length,  col.names=c("subject"))


print('Joining data...')
# 3. Construct the two sets
samsung.trainIndices <- (1+samsung.set.test.length):(samsung.set.test.length+samsung.set.train.length)
samsung.df.test   <- join(data.frame(id=1:samsung.set.test.length,samsung.set.test.rownames), join(data.frame(id=1:samsung.set.test.length, samsung.labels.test), data.frame(id=1:samsung.set.test.length, samsung.set.test)))
samsung.df.train  <- join(data.frame(id=samsung.trainIndices, samsung.set.train.rownames), join(data.frame(id=samsung.trainIndices, samsung.labels.train), data.frame(id=samsung.trainIndices, samsung.set.train)))

# Create the merged frame
samsung.df.merged <- rbind(samsung.df.test,samsung.df.train)

# Filter down to any column that has mean or standard (dev) in it
samsung.meanColumns <- gdata::matchcols(samsung.df.merged, "mean")
samsung.standardColumns <- gdata::matchcols(samsung.df.merged, "standard")
samsung.relevantColumns <-  c("id","activity_name","subject",c(samsung.meanColumns,samsung.standardColumns))
samsung.df <- samsung.df.merged[,samsung.relevantColumns]                                            
# group by activity name
samsung.group1 <- group_by(samsung.df, activity_name)
# group again (add=T) by subject
samsung.group2 <- group_by(samsung.group1, subject, add = T)


print('Creating Summary...')
excludedCols = c(1,2) #id/subject
samsung.finalSummary <- summarise_each(samsung.group2, funs(mean), -excludedCols)


write.table(samsung.finalSummary, samsung.output.summary, row.name=F)
print(cat(nrow(samsung.finalSummary),'rows written to ',samsung.output.summary))


