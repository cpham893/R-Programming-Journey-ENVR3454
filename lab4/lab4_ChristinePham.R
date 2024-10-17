# string
name<-c("Ben", "Martin", "Andy", "Paul", "Graham", "Carina", "Karina", "Doug", "Mark", "Zoe")


# date
DoB<-as.Date(c("1977-07-03", "1969-05-24", "1973-06-21",
                "1970-07-16", "1949-10-10", "1983-11-05", 
                "1987-10-08", "1989-09-16", "1973-05-20", 
                "1984-11-12"))


# numeric
job<-c(1,1,1,1,1,2,2,2,2,2)
job<-c(rep(1, 5),rep(2, 5))

friends<-c(5,2,0,4,1,10,12,15,12, 17)
alcohol<-c(10,15,20,5,30,25,20,16,17,18)  
income<-c(20000,40000,35000,22000,50000,5000,100,3000,10000,10)
neurotic<-c(10,17,14,13,21,7,13,9,14,13)


# transform to factor (similar to encoding)
job<-factor(job, levels = c(1:2), labels = c("Lecturer", "Student"))


# data frame
lecturerData<-data.frame(name, DoB, job, friends,  alcohol, income, neurotic)
View(lecturerData)

# create column
lecturerData$alcohol_neurotic <- lecturerData$alcohol -  lecturerData$neurotic
View(lecturerData)



# set working directory to area that files will go to when downloaded
setwd("C:/Users/chris/OneDrive/Documents/school/envr stats/Assignments_Homework")

# convert to txt
### write.table(dataframe, “filename.txt”, sep=“\t”, row.names = FALSE)
write.table(lecturerData, "LecturerData_Lab4.txt", sep="\t", row.names =  FALSE)

# convert to csv
### write.csv(dataframe, “filename.csv”)
write.csv(lecturerData, "LecturerData_Lab4.csv")


# read file from computer into R
lecturerData2 <- read.csv("LecturerData_Lab4.csv", header=TRUE)
View(lecturerData2)




# reshape dataframe

# melt()
#newDataFrame<-melt(oldDataFrame, id = c(constant variables),  measured = c(variables that change across columns)
#newData<-cast(moltenData, variables coded within a single column ~ variables coded many columns, value = “outcome variable”)
#newDataFrame<-stack(oldDataFrame, select = c(variable list))
#newDataFrame<-unstack(oldDataFrame, scores ~ columns)
#newDataFrame<-oldDataFrame [rows, columns]
#lecturerPersonality<-lecturerData[, c(“friends”, “alcohol”,  “neurotic”)]
#lecturerOnly<-lecturerData[job==“Lecturer”,]
#lecturerOnly<-subset(lecturerData, job==“Lecturer”)
#lecturerOnly<-subset(lecturerData, alcohol>10,  select=c(“friends”, “alcohol”, “neurotic”))

library(reshape2)

data1 <- data.frame(
  subject = c("A", "A", "B", "B"),
  variable = c("Height", "Weight", "Height", "Weight"),
  value = c(160, 55, 170, 70)
)
View(data1)

# Sample data
data2 <- data.frame(
  values = c(1, 2, 3, 4, 5, 6),
  category = c("A", "A", "B", "B", "C", "C")
)
View(data2)



# Reshaping the data

### cast(): complex, long to wide
wide_data <- dcast(data1, subject ~ variable, value.var = "value")
View(wide_data)


### melt(): complex, wide to long
long_data <- melt(wide_data, id.vars = "subject", measure.vars = c("Height", "Weight"))
View(long_data)




### unstack(): simple, long to wide
wide_data <- unstack(data2, values ~ category)
View(wide_data)


### stack(): simple, wide to long
long_data <- stack(wide_data)
View(long_data)

