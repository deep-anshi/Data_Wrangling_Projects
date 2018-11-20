#install.packages("SASxport")
#install.packages("Hmisc")
library(SASxport)

#install.packages("data.table")
library("data.table")
#install.packages("rio")
library(rio)
convert("DIQ_I.XPT","DIQ_I.csv")
import("DIQ_I.csv")
mt1<-read.csv(file ="DIQ_I.csv", header = TRUE )

write.csv(mt1,"mt1.csv")
mt1

library(plyr)
length(mt1$SEQN)
length(mt1$DID060)
count(mt1,'DID341')
count(mt1,'DIQ080')
count(mt1,'DIQ175D')

#Dropping columns
mt1$DIQ010<-NULL
mt1$DIQ050<-NULL
mt1$DIQ240<-NULL
mt1$DIQ275<-NULL

colnames(mt1)[colnames(mt1)=="DID040"] <- "AGE[DIABETES RECOGNIZED]"
colnames(mt1)[colnames(mt1)=="DIQ160"] <- "PREDIABETES"
colnames(mt1)[colnames(mt1)=="DIQ170"] <- "AT RISK[DR]"
colnames(mt1)[colnames(mt1)=="DIQ172"] <- "AT RISK[SELF]"
colnames(mt1)[colnames(mt1)=="DIQ180"] <- "HAD BLOOD TEST PAST THREE YEARS"
colnames(mt1)[colnames(mt1)=="DID060"] <- "INSULIN"
colnames(mt1)[colnames(mt1)=="DIQ060U"] <- "I_UNIT"
colnames(mt1)[colnames(mt1)=="DIQ070"] <- "DIABETIC PILLS"
colnames(mt1)[colnames(mt1)=="DIQ230"] <- "LAST TIME SEEN A DIABETES SPECIALIST"
colnames(mt1)[colnames(mt1)=="DID250"] <- "SEEN DOCTOR LAST YEAR"
colnames(mt1)[colnames(mt1)=="DID260"] <- "BLOOD CHECK"
colnames(mt1)[colnames(mt1)=="DIQ260U"] <- "BC_UNIT"
colnames(mt1)[colnames(mt1)=="DIQ280"] <- "A1C[LAST]"
colnames(mt1)[colnames(mt1)=="DIQ291"] <- "A1C[SHOULD BE]"
colnames(mt1)[colnames(mt1)=="DIQ300S"] <- "SBP[RECENT]"
colnames(mt1)[colnames(mt1)=="DIQ300D"] <- "DBP[RECENT]"
colnames(mt1)[colnames(mt1)=="DID310S"] <- "SBP[SHOULD BE]"
colnames(mt1)[colnames(mt1)=="DID310D"] <- "DBP[SHOULD BE]"
colnames(mt1)[colnames(mt1)=="DID320"] <- "LDL[RECENT]"
colnames(mt1)[colnames(mt1)=="DID330"] <- "LDL[SHOULD BE]"
colnames(mt1)[colnames(mt1)=="DID341"] <- "FEET CHECKED LAST YEAR[DOCTOR]"
colnames(mt1)[colnames(mt1)=="DID350"] <- "FEET CHECKED[SELF]"
colnames(mt1)[colnames(mt1)=="DIQ350U"] <- "FC_UNIT"
colnames(mt1)[colnames(mt1)=="DIQ360"] <- "PUPILS DILATED[LAST TIME]"
colnames(mt1)[colnames(mt1)=="DIQ080"] <- "EYES_AFFECTED/RETINO"

str(mt1)
mt1$`AGE[DIABETES RECOGNIZED]` <-as.factor(mt1$`AGE[DIABETES RECOGNIZED]`)
mt1$PREDIABETES <-as.factor(mt1$PREDIABETES)
mt1$`AT RISK[DR]` <-as.factor(mt1$`AT RISK[DR]`)
mt1$`AT RISK[SELF]` <-as.factor(mt1$`AT RISK[SELF]`)
mt1$DIQ175A <-as.factor(mt1$DIQ175A)
mt1$DIQ175B <-as.factor(mt1$DIQ175B)
mt1$DIQ175C <-as.factor(mt1$DIQ175C)
mt1$DIQ175D <-as.factor(mt1$DIQ175D)
mt1$DIQ175E <-as.factor(mt1$DIQ175E)
mt1$DIQ175F <-as.factor(mt1$DIQ175F)
mt1$DIQ175G <-as.factor(mt1$DIQ175G)
mt1$DIQ175H <-as.factor(mt1$DIQ175H)
mt1$DIQ175I <-as.factor(mt1$DIQ175I)
mt1$DIQ175J <-as.factor(mt1$DIQ175J)
mt1$DIQ175K <-as.factor(mt1$DIQ175K)
mt1$DIQ175L <-as.factor(mt1$DIQ175L)
mt1$DIQ175M <-as.factor(mt1$DIQ175M)
mt1$DIQ175N <-as.factor(mt1$DIQ175N)
mt1$DIQ175O <-as.factor(mt1$DIQ175O)
mt1$DIQ175P <-as.factor(mt1$DIQ175P)
mt1$DIQ175Q <-as.factor(mt1$DIQ175Q)
mt1$DIQ175R <-as.factor(mt1$DIQ175R)
mt1$DIQ175S <-as.factor(mt1$DIQ175S)
mt1$DIQ175T <-as.factor(mt1$DIQ175T)
mt1$DIQ175U <-as.factor(mt1$DIQ175U)
mt1$DIQ175V <-as.factor(mt1$DIQ175V)
mt1$DIQ175W <-as.factor(mt1$DIQ175W)
mt1$DIQ175X <-as.factor(mt1$DIQ175X)
str(mt1)

mt1$`HAD BLOOD TEST PAST THREE YEARS` <-as.factor(mt1$`HAD BLOOD TEST PAST THREE YEARS`)
mt1$INSULIN <-as.factor(mt1$INSULIN)
mt1$I_UNIT <-as.factor(mt1$I_UNIT)
mt1$`DIABETIC PILLS` <-as.factor(mt1$`DIABETIC PILLS`)
mt1$`LAST TIME SEEN A DIABETES SPECIALIST` <-as.factor(mt1$`LAST TIME SEEN A DIABETES SPECIALIST` )
mt1$`SEEN DOCTOR LAST YEAR` <-as.factor(mt1$`SEEN DOCTOR LAST YEAR`)
mt1$`BLOOD CHECK` <-as.factor(mt1$`BLOOD CHECK`)
mt1$BC_UNIT <-as.factor(mt1$BC_UNIT)
mt1$`A1C[LAST]` <-as.factor(mt1$`A1C[LAST]`)
mt1$`A1C[SHOULD BE]` <-as.factor(mt1$`A1C[SHOULD BE]`)
mt1$`SBP[RECENT]` <-as.factor(mt1$`SBP[RECENT]`)
mt1$`DBP[RECENT]` <-as.factor(mt1$`DBP[RECENT]`)
mt1$`SBP[SHOULD BE]` <-as.factor(mt1$`SBP[SHOULD BE]`)
mt1$`DBP[SHOULD BE]` <-as.factor(mt1$`DBP[SHOULD BE]`)
mt1$`LDL[RECENT]` <-as.factor(mt1$`LDL[RECENT]`)
mt1$`LDL[SHOULD BE]` <-as.factor(mt1$`LDL[SHOULD BE]`)
mt1$`FEET CHECKED LAST YEAR[DOCTOR]` <-as.factor(mt1$`FEET CHECKED LAST YEAR[DOCTOR]`)
mt1$`FEET CHECKED[SELF]` <-as.factor(mt1$`FEET CHECKED[SELF]`)
mt1$FC_UNIT <-as.factor(mt1$FC_UNIT)
mt1$`PUPILS DILATED[LAST TIME]` <-as.factor(mt1$`PUPILS DILATED[LAST TIME]`)
mt1$`EYES_AFFECTED/RETINO` <-as.factor(mt1$`EYES_AFFECTED/RETINO`)

str(mt1)

mt1$PREDIABETES <- factor(mt1$PREDIABETES, levels = c(1,2,7,9), labels = c("Yes","No","Refused","Donot know"))
mt1$`AT RISK[DR]` <- factor(mt1$`AT RISK[DR]`, levels = c(1,2,7,9), labels = c("Yes","No","Refused","Donot know"))
mt1$`AT RISK[SELF]` <- factor(mt1$`AT RISK[SELF]`, levels = c(1,2,7,9), labels = c("Yes","No","Refused","Donot know"))
mt1$`HAD BLOOD TEST PAST THREE YEARS` <- factor(mt1$`HAD BLOOD TEST PAST THREE YEARS`, levels = c(1,2,7,9), labels = c("Yes","No","Refused","Donot know"))
mt1$`DIABETIC PILLS`<- factor(mt1$`DIABETIC PILLS`, levels = c(1,2,7,9), labels = c("Yes","No","Refused","Donot know"))
mt1$`LAST TIME SEEN A DIABETES SPECIALIST`<- factor(mt1$`LAST TIME SEEN A DIABETES SPECIALIST`, levels = c(1,2,3,4,5,7,9), labels = c("1 Year ago or less","More than 1 year ago but not more than 2 years ago","More than 2 year ago but not more than 5 years ago","More than 5 years sgo","Never","Refused","Donot know"))
mt1$`A1C[SHOULD BE]`<- factor(mt1$`A1C[SHOULD BE]`, levels = c(1,2,3,4,5,6,77,99), labels = c("Less than 6","Less than 7","Less than 8","Less than 9","Less than 10","Provider did not specify goal","Refused","Donot know"))
mt1$`PUPILS DILATED[LAST TIME]`<- factor(mt1$`PUPILS DILATED[LAST TIME]`, levels = c(1,2,3,4,5,7,9), labels = c("Less than 1 month","1-12 months","13-24 months","Greater than 2 years","Never","Refused","Donot know"))
mt1$`EYES_AFFECTED/RETINO`<- factor(mt1$`EYES_AFFECTED/RETINO`, levels = c(1,2,7,9), labels = c("Yes","No","Refused","Donot know"))

#install.packages("plyr")
library("plyr")

mt1 <- transform(mt1,DIQ175A =revalue(DIQ175A,c("10"="Family History")))
mt1 <- transform(mt1,DIQ175B =revalue(DIQ175B,c("11"="Overweight")))
mt1 <- transform(mt1,DIQ175C =revalue(DIQ175C,c("12"="Age")))
mt1 <- transform(mt1,DIQ175D =revalue(DIQ175D,c("13"="Poor diet")))
mt1 <- transform(mt1,DIQ175E =revalue(DIQ175E,c("14"="Race")))
mt1 <- transform(mt1,DIQ175F =revalue(DIQ175F,c("15"="Baby weight[>9lb]")))
mt1 <- transform(mt1,DIQ175G =revalue(DIQ175G,c("16"="Lack of physical activity")))
mt1 <- transform(mt1,DIQ175H =revalue(DIQ175H,c("17"="HBP")))
mt1 <- transform(mt1,DIQ175I =revalue(DIQ175I,c("18"="HB Sugar")))
mt1 <- transform(mt1,DIQ175J =revalue(DIQ175J,c("19"="High cholestrol")))
mt1 <- transform(mt1,DIQ175K =revalue(DIQ175K,c("20"="Hypogylcemic")))
mt1 <- transform(mt1,DIQ175L =revalue(DIQ175L,c("21"="Extreme hunger")))
mt1 <- transform(mt1,DIQ175M =revalue(DIQ175M,c("22"="Tingling/Numbness")))
mt1 <- transform(mt1,DIQ175N =revalue(DIQ175N,c("23"="Blurred vision")))
mt1 <- transform(mt1,DIQ175O =revalue(DIQ175O,c("24"="Increased fatigue")))
mt1 <- transform(mt1,DIQ175P =revalue(DIQ175P,c("25"="Anyone could be at risk")))
mt1 <- transform(mt1,DIQ175Q =revalue(DIQ175Q,c("26"="Doctor warning")))
mt1 <- transform(mt1,DIQ175R =revalue(DIQ175R,c("27"="Other")))
mt1 <- transform(mt1,DIQ175S =revalue(DIQ175S,c("28"="Gestational diabetes")))
mt1 <- transform(mt1,DIQ175T =revalue(DIQ175T,c("29"="Frequent Urination")))
mt1 <- transform(mt1,DIQ175U =revalue(DIQ175U,c("30"="Thirst")))
mt1 <- transform(mt1,DIQ175V =revalue(DIQ175V,c("31"="Craving for sweet/eating a lot of sugar")))
mt1 <- transform(mt1,DIQ175W =revalue(DIQ175W,c("32"="Medication")))
mt1 <- transform(mt1,DIQ175X =revalue(DIQ175X,c("33"="POS")))

colnames(mt1)[colnames(mt1)=="DIQ175A"] <- "A"
colnames(mt1)[colnames(mt1)=="DIQ175B"] <- "B"
colnames(mt1)[colnames(mt1)=="DIQ175C"] <- "C"
colnames(mt1)[colnames(mt1)=="DIQ175D"] <- "D"
colnames(mt1)[colnames(mt1)=="DIQ175E"] <- "E"
colnames(mt1)[colnames(mt1)=="DIQ175F"] <- "F"
colnames(mt1)[colnames(mt1)=="DIQ175G"] <- "G"
colnames(mt1)[colnames(mt1)=="DIQ175H"] <- "H"
colnames(mt1)[colnames(mt1)=="DIQ175I"] <- "I"
colnames(mt1)[colnames(mt1)=="DIQ175J"] <- "J"
colnames(mt1)[colnames(mt1)=="DIQ175K"] <- "K"
colnames(mt1)[colnames(mt1)=="DIQ175L"] <- "L"
colnames(mt1)[colnames(mt1)=="DIQ175M"] <- "M"
colnames(mt1)[colnames(mt1)=="DIQ175N"] <- "N"
colnames(mt1)[colnames(mt1)=="DIQ175O"] <- "O"
colnames(mt1)[colnames(mt1)=="DIQ175P"] <- "P"
colnames(mt1)[colnames(mt1)=="DIQ175Q"] <- "Q"
colnames(mt1)[colnames(mt1)=="DIQ175R"] <- "R"
colnames(mt1)[colnames(mt1)=="DIQ175S"] <- "S"
colnames(mt1)[colnames(mt1)=="DIQ175T"] <- "T"
colnames(mt1)[colnames(mt1)=="DIQ175U"] <- "U"
colnames(mt1)[colnames(mt1)=="DIQ175V"] <- "V"
colnames(mt1)[colnames(mt1)=="DIQ175W"] <- "W"
colnames(mt1)[colnames(mt1)=="DIQ175X"] <- "X"

mt1$INSULIN<-as.numeric(mt1$INSULIN)
mt1$INSULIN<-mt1$INSULIN*
  ifelse(mt1$I_UNIT=="2",12,
         ifelse(mt1$I_UNIT=="1",1,0))
     
mt1$I_UNIT <- factor(mt1$I_UNIT, levels = c(1,2), labels = c("month","month"))

mt1$BLOOD.CHECK<-as.numeric(mt1$BLOOD.CHECK)
mt1$BLOOD.CHECK<-mt1$BLOOD.CHECK*
  ifelse(mt1$BC_UNIT=="1",365,
         ifelse(mt1$BC_UNIT=="2",52,
                ifelse(mt1$BC_UNIT=="3",12,
                       ifelse(mt1$BC_UNIT=="4",1,0))))

mt1$BC_UNIT <- factor(mt1$BC_UNIT, levels = c(1,2,3,4), labels = c("per year","per year","per year","per year"))

mt1$FEET.CHECKED.SELF.<- as.numeric(mt1$FEET.CHECKED.SELF.)
mt1$FEET.CHECKED.SELF.<-mt1$FEET.CHECKED.SELF.*
  ifelse(mt1$FC_UNIT=="1",365,
         ifelse(mt1$FC_UNIT=="2",52,
                ifelse(mt1$FC_UNIT=="3",12,
                       ifelse(mt1$FC_UNIT=="4",1,0))))
mt1$FC_UNIT <- factor(mt1$FC_UNIT, levels = c(1,2,3,4), labels = c("per year","per year","per year","per year"))


View(mt1)

mt1$SBP.RECENT.<-as.numeric(mt1$SBP.RECENT.)
mt1$DBP.RECENT.<-as.numeric(mt1$DBP.RECENT.)
mt1$SBP.SHOULD.BE.<-as.numeric(mt1$SBP.SHOULD.BE.)
mt1$DBP.SHOULD.BE.<-as.numeric(mt1$DBP.SHOULD.BE.)
mt1$LDL.RECENT.<-as.numeric(mt1$LDL.RECENT.)
mt1$LDL.SHOULD.BE.<-as.numeric(mt1$LDL.SHOULD.BE.)

mt1$desired_SBP <- (mt1$SBP.SHOULD.BE. - mt1$SBP.RECENT.)
mt1$desired_DBP <- (mt1$DBP.SHOULD.BE. - mt1$DBP.RECENT.)
mt1$desired_LDL <- (mt1$LDL.SHOULD.BE. - mt1$LDL.RECENT.)

mt1$AGE.DIABETES.RECOGNIZED.<-as.numeric(mt1$AGE.DIABETES.RECOGNIZED.)
mt1$AGE.DIABETES.RECOGNIZED.[mt1$AGE.DIABETES.RECOGNIZED==80]<-90
mt1$AGE.DIABETES.RECOGNIZED.[mt1$AGE.DIABETES.RECOGNIZED.==666]<-0.5
mean(mt1$AGE.DIABETES.RECOGNIZED.[mt1$AGE.DIABETES.RECOGNIZED.>0 & mt1$AGE.DIABETES.RECOGNIZED.<=90],na.rm=TRUE)
