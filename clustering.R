#Clustering

marks1=c(13,1,4,5,9,2,6)
marks=data.frame((marks1))
length(marks1)
plot(marks1)

k1= kmeans(marks, centers=2)
k1
cbind(marks,k1$cluster)

(marks2= sample(1:10, size=7))
newmarks=data.frame(marks1, marks2)
newmarks
k2=kmeans(newmarks, centers=3)
cbind(newmarks,k2$cluster)