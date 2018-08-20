students
write.csv(students,'./data/iimtrichy.csv')
students2= read.csv('./data/iimtrichy.csv')
head(students2)
students3= read.csv(file.choose())

library(gsheet)
url='https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907'
denco= as.data.frame(gsheet2tbl(url))
str(denco)
head(denco)
denco %>% count(custname, sort = T)

denco %>% group_by(custname) %>% summarise(n=n()) %>% arrange((desc(n)))

df3a=aggregate(denco$revenue, by=list(denco$partnum), FUN=sum)
head(df3a)

denco %>% group_by(partnum) %>% summarise(n=n()) %>% arrange(desc(n))


names(sales)
df4a = aggregate(margin- partnum, data=sales, FUN=sum)


