install.packages("dplyr")
install.packages("tidyr")
install.packages("RODBC")
library(RODBC)
mycom <- odbcConnect("dartmouth1","dshokeen","dshokeen@qbs181")
Demographics <- sqlQuery(mycom, "select * from Demographics")
ChronicConditions<-sqlQuery(mycom,"select * from ChronicConditions")
Text<-sqlQuery(mycom,"select * from Text")


merge1 <- merge(data.frame(Demographics), data.frame(ChronicConditions), by.x='contactid', by.y='tri_patientid')
merge2 <- merge(data.frame(merge1), data.frame(Text), by.x='contactid', by.y='tri_contactId')

library(dplyr)
library(magrittr)
library(tidyverse)
library(lubridate)

#k <- merge2 %>%
 # mutate(latest_date = max(TextSentDate)) %>%
#  select(latest_date, contactid, gendercode, tri_age,parentcontactidname, tri_imaginecareenrollmentstatus, address1_stateorprovince, tri_imaginecareenrollmentemailsentdate, tri_enrollmentcompletedate, test, tri_name, SenderName)


maxdate <- merge2%>%group_by(contactid)%>%top_n(1,TextSentDate)
  
#It gives 11 variable and 4619 observations which matches with sql number of observations
