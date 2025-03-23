### R. project. ###

#I load thee libraries that I need for this project
library(dplyr)
library(ggplot2)



airquality
head(airquality)
# Handling with NA values

mean(airquality$Ozone)
mean(airquality$Ozone,na.rm=TRUE)

max(airquality$Solar.R)
max(airquality$Solar.R,na.rm=TRUE)

#Removing NA's values and data cleeaning

summary(airquality)
air<-airquality
air$Ozone<-ifelse(is.na(air$Ozone),median(air$Ozone,na.rm=TRUE),air$Ozone)
air$Solar.R<-ifelse(is.na(air_solar$Solar.R),median(air_solar$Solar.R,na.rm=TRUE),air_solar$Solar.R)
summary(air)

head(air)

##  Adding one more variable that says when sola.R is > 100, can be dangerous

air$Solar.R.Danger<-air$Solar.R>100
head(air)
 ## Transformations of months

airmo<-air%>%mutate(Month=recode(Month,
                                 `1`="January",`2`="February",`3`="March",`4`="April",`5`="May",`6`="June",`7`="July",
                                 `8`="August",`9`="September",`10`="Octobr",`11`="November",`12`="Deecmber"))
head(airmo)

# Graphics of how the temperature looks every month.

ggplot(airmo,aes(x=Month,y=Temp))+
         geom_line(group=1,color="skyblue", size=1)+
         geom_point(color="blue")+
         labs(title="Monthly Temperature Trend",x="Month",y="Temperature")+
         theme_minimal()+
         theme(axis.text.x=element_text(angle=45,hjust=1))

# Temperature in the month of May

may_month<-airmo%>%filter(Month=="May")
print(may_month)


ggplot(may_month,aes(x=Day,y=Temp))+geom_line(group=1,color="skyblue",size=1)+
  geom_point(color="red")+labs(Title="Temperature in the emonth of May",x="May",y="Temperature")+theme_minimal()

#Temperature in the month of June 
june_month<-airmo%>%filter(airmo$Month=="June")
june_month

ggplot(june_month,aes(x=as.factor(Day),y=Temp))+
  geom_point(color="blue")+labs(title="Temperature in the month of June",x="June",y="Temprature")+theme_minimal()+
  theme(axis.text.x=element_text(angle=45,hjust=1))
  

#Temperature in July

ggplot(july_month,aes(x=Day,y=Temp))+geom_line(group=1,color="black",size=1)+geom_point(color="blue")+
  labs(title = "Temperature in July",y="Temperature")+theme_minimal()


#Temperatur in September
September_month<-airmo%>%filter(airmo$Month=="September")
September_month  



ggplot(September_month,aes(x=as.factor(Day),y=Temp))+geom_boxplot()+
  labs(title="Temperature in September",x="",y="Temperature")+theme_minimal()+
  theme(axis.text.x=element_text(angle=45,hjust =1))

