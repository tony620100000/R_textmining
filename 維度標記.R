#資料設定
dimension<-as.matrix.data.frame(keyword_data)#關鍵字(可用正規寫)
dimension_data<-as.matrix.data.frame(test_data)#預標記資料
dimension_data_n<-dimension_data

#進行標記
for(i in 1:length(dimension))
{
  x<-grepl(dimension[i,],dimension_data)
  x<-sub("TRUE",replacement = 1,x)
  x<-sub("FALSE",replacement = 0,x)
  dimension_data_n<-cbind(dimension_data_n,x)
}

#欄位命名
colnames(dimension_data_n)<-c("內文",dimension)


#輸出
write.csv(dimension_data_n,file="output.csv",row.names = FALSE)