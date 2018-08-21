#Data Structures

#Vectors----
v1=1:100  #create vector 1 to 100
v2 = c(1,4,5,10) #numeric
class(v1) #class of vector
class(v2)
v3= c('a','b','gaitonde') #character vector
v3
class(v3)
v4= c(TRUE, FALSE, T, T, F) #logical vector
class(v4)

#summary on vectors
median(v1)
sd(v1)
var(v1)

hist(v1) #histogram function
hist(women$height) # use $ symbol to access

v2
v2[v2>=5] #Filter

x= rnorm(60, mean= 60, sd=10)
x

plot(x)
hist(x)
plot(density(x))
abline(v=60) #mean line at 60


#rectangle and density together
hist(x, freq=F)
lines(density(x))

hist(x, breaks=10, col=1:10)
length(x)
sd(x)


?sample
x1=LETTERS[5:20]
x1

set.seed(1234) #particular pattern setting
y1=sample(x1)
y1
?sample

set.seed(33)
(y2= sample(x1, size=5))

(gender=sample(c('M','F'), size=65, replace=TRUE, prob=c(.6,.4)))
t1=table(gender)
prop.table(t1)
pie(t1)

barplot(t1, col=1:2, horiz=T)

#matrix----

(m1=matrix(1:24, nrow=4))
(m2=matrix(1:24, nrow=4, byrow = T)) #bydefault byrow is F

(m3=matrix(1:24, ncol = 4, byrow = T))

?runif
(x=trunc(runif(60, 60, 100)))
#round, trunc, ceiling, floor
plot(density(x))

(m4=matrix(x, ncol=6))
#function on rows and cols
colSums(m4)
rowSums(m4)
rowMeans(m4)
colMeans(m4)


#

m4[m4>67 & m4<86]
m4[10,]
m4[8:10,]
m4[8:10, c(1,3,5)] #selective column value from row mentioned

rowSums(m4[8:10, c(1,3,5)])

#array----

#data.frame
#rollno, name, gender, course, marks1, marks2

rollno = 1:60
(name=paste('student', 1:60, sep='-')) #concatenate to cretae 60 names
(name=paste('IIM',paste('student', 1:60, sep='-'), sep='&')) #nested concat

name[1:10]
name[15:20]
name[c(15,20,37)]
name[-c(1:10)] #negative filter
rev(name) #Reverse
name[-c(1:10, 30:35)] #negative filter for more than one range

(gender=sample(c('Male','Female'), size=60, replace=T, prob=c(.3,.7)))

(course=sample(c('BBA','MBA','MS'), size=60, replace=T, prob=c(.4,.3,.3)))
(marks1= ceiling(rnorm(60, mean=65, sd=7)))
(marks2= ceiling(rnorm(60, mean=60, sd=11)))
(grades=sample(c('A','B','C'), size=60, replace=T))

students= data.frame(rollno, name, gender, course, marks1, marks2, grades, stringsAsFactors = F)

class(students)
View(students)
summary(students)

students[, c('name')]
students[students$gender=='Male', c('rollno','gender','marks1')]
students[students$gender=='Male' & students$grades =='C', c('rollno','gender','marks1')]

students[students$marks1>55|students$marks1<75, c('name','marks1')]


students$gender
t1=table(students$gender)
barplot(table(students$course), ylim=c(0,50), col=1:3)
text(1:3, table(students$course)+5, table(students$course))

str(students)
nrow(students)
names(students)
dim(students)
head(students)
head(students, n=7)
tail(students)


aggregate(students$marks1, by=list(students$gender), FUN=mean)
aggregate(students$marks2, by=list(students$course), FUN=max)
aggregate(students$marks2, by=list(students$course, students$gender), FUN=mean)

library(dplyr)
students %>% group_by(gender) %>% summarise(mean(marks1))
students %>% group_by(course,gender) %>% summarise(meanmarks1=mean(marks1), min(marks2), max(marks2)) %>% arrange(desc(meanmarks1))

students %>% arrange(desc(marks1)) %>% filter(gender=='Male') %>% top_n(n=5)

students %>% sample_frac(0.1)
students %>% sample_n(2)

students %>% arrange(desc(course), gender, marks1)
students %>% arrange(course, grades, marks1) %>% select(course, grades, marks1) %>% filter(course=='BBA')


students$gender=factor(students$gender)
summary(students$gender)
summary(students$course)
students$course=factor(students$course, ordered = T)
summary(students$course)
students$course=factor(students$course, ordered = T, levels = c('FPM','MBA','BBA'))
summary(students$course)
students$grades

students$grades=factor(students$grades, ordered = T, levels = c('B','A','C'))
students$grades
table(students$grades)
barplot(table(students$grades))

students
write.csv(students,'./data/iimtrichy.csv')
students2= read.csv('./data/iimtrichy.csv')
head(students2)
students3= read.csv(file.choose())

library(gsheet)
url='https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=1422958175'
denco= as.data.frame(gsheet2tbl(url))
str(denco)





