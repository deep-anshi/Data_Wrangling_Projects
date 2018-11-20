select * from [dshokeen].[mt1]
select count([SEQN]) from [dshokeen].[mt1]
--9575
select count(DIQ160) from [dshokeen].[mt1]
--9575
--checking if it there is any row with all the null values
delete from [dshokeen].[mt1] where ([DID040] IS NULL)
AND( [DIQ160] IS NULL)
AND ([DIQ170] IS NULL)
AND ([DIQ172] IS NULL)
AND ([DIQ175A] IS NULL)
AND ([DIQ175B] IS NULL)
AND ([DIQ175C] IS NULL)
AND ([DIQ175D] IS NULL)
AND ([DIQ175E] IS NULL)
AND ([DIQ175F] IS NULL)
AND ([DIQ175G] IS NULL)
AND ([DIQ175H] IS NULL)
AND ([DIQ175I] IS NULL)
AND ([DIQ175J] IS NULL)
AND ([DIQ175K] IS NULL)
AND ([DIQ175L] IS NULL)
AND ([DIQ175M] IS NULL)
AND ([DIQ175N] IS NULL)
AND ([DIQ175O] IS NULL)
AND ([DIQ175P] IS NULL)
AND ([DIQ175Q] IS NULL)
AND ([DIQ175R] IS NULL)
AND ([DIQ175S] IS NULL)
AND ([DIQ175T] IS NULL)
AND ([DIQ175U] IS NULL)
AND ([DIQ175V] IS NULL)
AND ([DIQ175W] IS NULL)
AND ([DIQ175X] IS NULL)
AND ([DIQ180] IS NULL)
AND ([DID060] IS NULL)
AND ([DIQ060U] IS NULL)
AND ([DIQ070] IS NULL)
AND ([DIQ230] IS NULL)
AND ([DIQ240] IS NULL)
AND ([DID250] IS NULL)
AND ([DID260] IS NULL)
AND ([DIQ260U] IS NULL)
AND ([DIQ275] IS NULL)
AND ([DIQ280] IS NULL)
AND ([DIQ291] IS NULL)
AND ([DIQ300S] IS NULL)
AND ([DIQ300D] IS NULL)
AND ([DID310S] IS NULL)
AND ([DID310D] IS NULL)
AND ([DID320] IS NULL)
AND ([DID330] IS NULL)
AND ([DID341] IS NULL)
AND ([DID350] IS NULL)
AND ([DIQ350U] IS NULL)
AND ([DIQ360] IS NULL)
AND ([DIQ080] IS NULL)
--there is no such row

select count([SEQN]) from [dshokeen].[mt1]

--diq010(dropping)This is because its not adding value to the data in a sense that DID040 can also be changed to get this coloumn and it it can also be shown This can be also shown by counting the number of counts for 'yes' in DIQ010 which is approximately equal to cumulative of DID040(AGE) excluding the dont know, refused and missing responses.  
ALTER TABLE [dshokeen].[mt1]
DROP COLUMN [DIQ010]

--diq040(name, nvarchar, 90,0.5, didnt replace na's)
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DID040] nvarchar(max);
update [dshokeen].[mt1]
set [DID040]='90' where [DID040]='80';
update dshokeen.mt1
set [DID040]= '0.5' where [DID040]='666';
update dshokeen.mt1
set [DID040]='Refused' where [DID040]='777';
update dshokeen.mt1
set[DID040]='Donot know' where[DID040]='999';

sp_rename '[dshokeen].[mt1].[DID040]', 'AGE[DIABETES RECOGNIZED] ', 'COLUMN';

--diq160,changing coloumn name and factor variables
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ160] nvarchar(max);
update dshokeen.mt1
set [DIQ160]='Yes' where [DIQ160]='1';
update dshokeen.mt1
set [DIQ160]= 'No' where [DIQ160]='2';
update dshokeen.mt1
set [DIQ160]='Donot know' where [DIQ160]='9';

sp_rename '[dshokeen].[mt1].[DIQ160]', 'PREDIABETES ', 'COLUMN';

--DIQ170, changing coloumn name and factor variables
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ170] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ170]='Yes' where [DIQ170]='1';
update [dshokeen].[mt1]
set [DIQ170]= 'No' where [DIQ170]='2';
update [dshokeen].[mt1]
set [DIQ170]='Donot know' where [DIQ170]='9';

sp_rename '[dshokeen].[mt1].[DIQ170]', 'AT RISK[DR] ', 'COLUMN';


ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ172] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ172]='Yes' where [DIQ172]='1';
update [dshokeen].[mt1]
set [DIQ172]= 'No' where [DIQ172]='2';
update [dshokeen].[mt1]
set[DIQ172]='Refused' where [DIQ172]='7';
update [dshokeen].[mt1]
set [DIQ172]='Donot know' where [DIQ172]='9';

sp_rename '[dshokeen].[mt1].[DIQ172]', 'AT RISK[SELF]', 'COLUMN';



--changing variable factors from the numbers to their meaning so that it would be easier to understand and reader don't have to look at notes again.

--Also we have to do statistical analysis in future we can treat them as binary varibale as run the regression analysis or other statistical tools to find the relation between each reason stated and diabetes present in person or if doctor warned about according to that reason or finding the relation between person feeling if he/she has diabetes and the reasons. We can also assign value 1 to every reason, add another coloumn with the sum of all reasons(ranging from 1to24) and running its analysis with other variables that we just mentioned.

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175A] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175A]= 'Family History' where [DIQ175A]= '10'
--sp_rename '[dshokeen].[mt1].[DIQ175A]', 'FAMILY HISTORY', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175B] nvarchar(max);
update [dshokeen].[mt1]
set[DIQ175B]= 'Overweight' where [DIQ175B]= '11'
--sp_rename '[dshokeen].[mt1].[DIQ175B]', 'OVERWEIGHT', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175C] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175C]= 'Age' where[DIQ175C]= '12'
--sp_rename '[dshokeen].[mt1].[DIQ175C]', 'AGE', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175D] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175D]= 'Poor diet' where [DIQ175D]= '13'
--sp_rename '[dshokeen].[mt1].[DIQ175D]', 'POOR DIET', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175E] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175E]= 'Race' where [DIQ175E]= '14'
--sp_rename '[dshokeen].[mt1].[DIQ175E]', 'RACE', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175F] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175F]= 'Baby weight[>9lb]' where [DIQ175F]= '15'
--sp_rename '[dshokeen].[mt1].[DIQ175F]', 'BABY WEIGHT[>9LB]', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175G] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175G]= 'Lack of physical activity' where [DIQ175G]= '16'
--sp_rename '[dshokeen].[mt1].[DIQ175G]', 'LACK OF PHYSICAL ACTIVITY', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175H] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175H]= 'HBP' where [DIQ175H]= '17'
--sp_rename '[dshokeen].[mt1].[DIQ175H]', 'HBP', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175I] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175I]= 'HB sugar' where[DIQ175I]= '18'
--sp_rename '[dshokeen].[mt1].[DIQ175I]', 'HB SUGAR', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175J]nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175J]= 'High cholestrol' where [DIQ175J]= '19'
--sp_rename '[dshokeen].[mt1].[DIQ175J]', 'HIGH CHOLESTROL', 'COLUMN';


ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175K]nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175K]= 'Hypoglycemic' where [DIQ175K]= '20'
--sp_rename '[dshokeen].[mt1].[DIQ175K]', 'HYPOGLYCEMIC', 'COLUMN';


ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175L] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175L]= 'Extreme hunger' where[DIQ175L]= '21'
--sp_rename '[dshokeen].[mt1].[DIQ175L]', 'EXTREME HUNGER', 'COLUMN';


ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175M] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175M]= 'Tingling/numbness' where [DIQ175M]= '22'
--sp_rename '[dshokeen].[mt1].[DIQ175M]', 'TINGLING/NUMBNESS', 'COLUMN';


ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175N] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175N]= 'Blurred vision' where [DIQ175N]= '23'
--sp_rename '[dshokeen].[mt1].[DIQ175N]', 'BLURRED VISION', 'COLUMN';


ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175O] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175O]= 'Increased fatigue' where [DIQ175O]= '24'
--sp_rename '[dshokeen].[mt1].[DIQ175O]', 'INCREASED FATIGUE', 'COLUMN';



ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175P] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175P]= 'Anyone could be at risk' where [DIQ175P]= '25'
--sp_rename '[dshokeen].[mt1].[DIQ175P]', 'ANYONECOULDBEATRISK', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175Q] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175Q]= 'Doctor warning' where [DIQ175Q]= '26'
--sp_rename '[dshokeen].[mt1].[DIQ175Q]', 'DOCTOR WARNING', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175R] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175R]= 'Other' where [DIQ175R]= '27'
--sp_rename '[dshokeen].[mt1].[DIQ175R]', 'OTHER', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175S] nvarchar(max);
update [dshokeen].[mt1]
set[DIQ175S]= 'Gestational diabetes' where [DIQ175S]= '28'
--sp_rename '[dshokeen].[mt1].[DIQ175S]', 'GESTATIONAL DIABETES', 'COLUMN';


ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175T] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175T]= 'Frequent urination' where [DIQ175T]= '29'
--sp_rename '[dshokeen].[mt1].[DIQ175T]', 'FREQUENT URINATION', 'COLUMN';


ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175U] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175U]= 'Thirst' where [DIQ175U]= '30'
--sp_rename '[dshokeen].[mt1].[DIQ175U]', 'THIRST', 'COLUMN';

ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175V] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175V]= 'Craving/eating sugar' where [DIQ175V]= '31'
--sp_rename '[dshokeen].[mt1].[DIQ175V]', 'CRAVING/EATING SUGAR', 'COLUMN';


ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175W] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175W]= 'Medication' where [DIQ175W]= '32'
--sp_rename '[dshokeen].[mt1].[DIQ175W]', 'MEDICATION', 'COLUMN';


ALTER TABLE [dshokeen].[mt1]
ALTER COLUMN [DIQ175X] nvarchar(max);
update [dshokeen].[mt1]
set [DIQ175X]= 'POS' where [DIQ175X]= '33'
--sp_rename '[dshokeen].[mt1].[DIQ175X]', 'POS', 'COLUMN';

--pasting all these reasons in one separate coloumn 
ALTER TABLE [dshokeen].[mt1]
ADD [REASONS TO BE AT RISK] NVARCHAR(max);
update [dshokeen].[mt1]
set [REASONS TO BE AT RISK] = (ISNULL([DIQ175A],'')
+ISNULL([DIQ175B],' ')
+ISNULL([DIQ175C],' ')
+ISNULL([DIQ175C],' ')
+ISNULL([DIQ175E],' ')
+ISNULL([DIQ175F],' ')
+ISNULL([DIQ175G],' ')
+ISNULL([DIQ175H],' ')
+ISNULL([DIQ175I],' ')
+ISNULL([DIQ175J],' ')
+ISNULL([DIQ175K],' ')
+ISNULL([DIQ175L],' ')
+ISNULL([DIQ175M],' ')
+ISNULL([DIQ175N],' ')
+ISNULL([DIQ175O],' ')
+ISNULL([DIQ175P],' ')
+ISNULL([DIQ175Q],' ')
+ISNULL([DIQ175R],' ')
+ISNULL([DIQ175S],' ')
+ISNULL([DIQ175T],' ')
+ISNULL([DIQ175U],' ')
+ISNULL([DIQ175V],' ')
+ISNULL([DIQ175W],' ')
+ISNULL([DIQ175X],' ') )

SELECT * FROM [dshokeen].[mt1]





--alteringdiq180, changing column name and renaming factor variables
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ180] nvarchar(max);
update dshokeen.mt1
set[DIQ180] ='Yes' where [DIQ180]='1';
update dshokeen.mt1
set [DIQ180]= 'No' where [DIQ180]='2';
update dshokeen.mt1
set[DIQ180]='Refused' where[DIQ180]='7';
update dshokeen.mt1
set [DIQ180] ='Donot know' where [DIQ180]='9';

sp_rename '[dshokeen].[mt1].[DIQ180]', 'HAD BLOOD TEST PAST THREE YEARS', 'COLUMN';



--dropping coloumn diq050 for the same reasons as earlier mentioned
ALTER TABLE [dshokeen].[mt1]
DROP COLUMN [DIQ050]

--altering diq060, changing column name and renaming factor variables, for less than 1 year, we have taken 0.5 as mean where code is 666 and have multiplied by 12 to convert it from years to months

ALTER TABLE dshokeen.mt1
ALTER COLUMN [DID060] nvarchar(max);
update dshokeen.mt1
set [DID060] = [DID060]*12 where [DIQ060U]='2';
update dshokeen.mt1
set  [DID060]= '0.5' where  [DID060]='666';
update dshokeen.mt1
set  [DID060]='Refused' where  [DID060]='777';
update dshokeen.mt1
set [DID060]='Donot know' where [DID060]='999';

sp_rename '[dshokeen].[mt1].[DID060]', 'INSULIN', 'COLUMN';

--here we are standardizing the coloumn into months

ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ060U] nvarchar(max);
update dshokeen.mt1
set [DIQ060U] = 'Months' where [DIQ060U]='1' or  [DIQ060U]='2';

sp_rename '[dshokeen].[mt1].[DIQ060U]', 'I_UNIT', 'COLUMN';
--We can merge these two coloumns of numbers with its units but I didn;t do it as it clean enough and can be easily understandable/interpretable by looking these two rows as they are side by side. Also if we want to run statistical analysis, we can easily do so by just leaving out the units coloumn and later on interpreting in for months(units) 

--altering diq070,changing column name and renaming factor variables
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ070] nvarchar(max);
update dshokeen.mt1
set[DIQ070] ='Yes' where [DIQ070]='1';
update dshokeen.mt1
set [DIQ070]= 'No' where [DIQ070]='2';
update dshokeen.mt1
set[DIQ070]='Refused' where[DIQ070]='7';
update dshokeen.mt1
set [DIQ070] ='Donot know' where [DIQ070]='9';
sp_rename '[dshokeen].[mt1].[DIQ070]', 'DIABETIC PILLS', 'COLUMN';

--ALTERING DIQ230

----DRopping diq240,Same with DIQ240(past year how many times seen a doctor) which doesnt add any new information as this information can be taken out from the coloumn DID250(past year how many times seen a doctor). This can also be shown by noticing that 'yes' count is 643 which exactly equal to the cumulative responses for DID250 excluding the missing values.
ALTER TABLE [dshokeen].[mt1]
DROP COLUMN [DIQ240]



ALTER TABLE dshokeen.mt1
ALTER COLUMN [DID250] nvarchar(max);
update dshokeen.mt1
set [DID250]  ='Refused' where  [DID250] ='7777';
update dshokeen.mt1
set [DID250] = 'Donot know' where [DID250] ='9999';
sp_rename '[dshokeen].[mt1].[DID250]', 'SEEN DOCTOR LAST YEAR', 'COLUMN';


ALTER TABLE dshokeen.mt1
ALTER COLUMN [DID260] nvarchar(max);
update dshokeen.mt1
set [DID260] = [DID260]*365 where [DIQ260U]='1';
update dshokeen.mt1
set [DID260] = [DID260]*52 where [DIQ260U]='2';
update dshokeen.mt1
set [DID260] = [DID260]*12 where [DIQ260U]='3';
update dshokeen.mt1
set [DID260]='Refused' where  [DID260]='777';
update dshokeen.mt1
set [DID260]='Donot know' where [DID260]='999';
sp_rename '[dshokeen].[mt1].[DID260]', 'BLOOD CHECK', 'COLUMN';

ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ260U] nvarchar(max);
update dshokeen.mt1
set [DIQ260U] = 'Per year' where [DIQ260U]='1' or  [DIQ260U]='2' or [DIQ260U]='3' or [DIQ260U]='4';
sp_rename '[dshokeen].[mt1].[DIQ260U]', 'BC_UNIT', 'COLUMN';


--removed this for the same reasons as above
ALTER TABLE [dshokeen].[mt1]
DROP COLUMN [DIQ275]

--altering diq280
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ280] nvarchar(max);
update dshokeen.mt1
set [DIQ280]  ='Refused' where [DIQ280]='777';
update dshokeen.mt1
set [DIQ280] = 'Donot know' where [DIQ280] ='999';
sp_rename '[dshokeen].[mt1].[DIQ280]', 'A1C[last]', 'COLUMN';
--altering diq291
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ291] nvarchar(max);
update dshokeen.mt1
set[DIQ291]  ='Didnt specify' where  [DIQ291]  ='6';
update dshokeen.mt1
set [DIQ291]   ='Refused' where  [DIQ291]  ='77';
update dshokeen.mt1
set[DIQ291]  = 'Donot know' where[DIQ291]  ='99';
sp_rename '[dshokeen].[mt1].[DIQ291]', 'A1C[SHOULD BE]', 'COLUMN';
--alterng diq300s
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ300S] nvarchar(max);
update dshokeen.mt1
set[DIQ300S]  ='Refused' where [DIQ300S] ='7777';
update dshokeen.mt1
set[DIQ300S] = 'Donot know' where [DIQ300S] ='9999';
sp_rename '[dshokeen].[mt1].[DIQ300S]', 'SBP[RECENT]', 'COLUMN';
--alterng diq300d
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ300D] nvarchar(max);
update dshokeen.mt1
set[DIQ300D] ='Refused' where [DIQ300D]='7777';
update dshokeen.mt1
set[DIQ300D]= 'Donot know' where [DIQ300D] ='9999';
sp_rename '[dshokeen].[mt1].[DIQ300D]', 'DBP[RECENT]', 'COLUMN';
--altering did310s
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DID310S] nvarchar(max);
update dshokeen.mt1
set[DID310S] ='Didnt specify' where [DID310S]='6666';
update dshokeen.mt1
set[DID310S] ='Refused' where[DID310S]='7777';
update dshokeen.mt1
set[DID310S]= 'Donot know' where [DID310S] ='9999';
sp_rename '[dshokeen].[mt1].[DID310S]', 'SBP[SHOULD BE]', 'COLUMN';
--altering did310d
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DID310D] nvarchar(max);
update dshokeen.mt1
set[DID310D]='Didnt specify' where[DID310D]='6666';
update dshokeen.mt1
set[DID310D] ='Refused' where[DID310D]='7777';
update dshokeen.mt1
set[DID310D]= 'Donot know' where [DID310D] ='9999';
sp_rename '[dshokeen].[mt1].[DID310D]', 'DBP[SHOULD BE]', 'COLUMN';

--altering did320
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DID320] nvarchar(max);
update dshokeen.mt1
set[DID320]='Never heard of LDL' where[DID320]='5555';
update dshokeen.mt1
set[DID320]='Didnt specify' where[DID320]='6666';
update dshokeen.mt1
set[DID320] ='Refused' where[DID320]='7777';
update dshokeen.mt1
set[DID320]= 'Donot know' where [DID320] ='9999';
sp_rename '[dshokeen].[mt1].[DID320]', 'LDL[RECENT]', 'COLUMN';
--altering did330
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DID330] nvarchar(max);
update dshokeen.mt1
set[DID330]='Didnt specify' where[DID330]='6666';
update dshokeen.mt1
set[DID330] ='Refused' where[DID330]='7777';
update dshokeen.mt1
set[DID330]= 'Donot know' where[DID330] ='9999';
sp_rename '[dshokeen].[mt1].[DID330]', 'LDL[SHOULD BE]', 'COLUMN';

--altering did341
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DID341] nvarchar(max);
update dshokeen.mt1
set[DID341] ='Refused' where[DID341]='7777';
update dshokeen.mt1
set[DID341]= 'Donot know' where[DID341]='9999';
sp_rename '[dshokeen].[mt1].[DID341]', 'FEET CHECKED LAST YEAR[DOCTOR]', 'COLUMN';
--
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DID350] nvarchar(max);
update dshokeen.mt1
set [DID350] = [DID350]*365 where [DIQ350U]='1';
update dshokeen.mt1
set [DID350] = [DID350]*52 where[DIQ350U]='2';
update dshokeen.mt1
set [DID350] = [DID350]*12 where [DIQ350U]='3';
update dshokeen.mt1
set [DID350]='Refused' where [DID350]='7777';
update dshokeen.mt1
set [DID350]='Donot know' where [DID350]='9999';
sp_rename '[dshokeen].[mt1].[DID350]', 'FEET CHECKED[SELF]', 'COLUMN';

ALTER TABLE dshokeen.mt1
ALTER COLUMN[DIQ350U]nvarchar(max);
update dshokeen.mt1
set [DIQ350U] = 'Per year' where [DIQ350U]='1' or  [DIQ350U]='2' or [DIQ350U]='3' or [DIQ350U]='4';
sp_rename '[dshokeen].[mt1].[DIQ350U]', 'FC_UNIT', 'COLUMN';

--altering diq360
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ360] nvarchar(max);
update dshokeen.mt1
set[DIQ360]='Less than 1 month' where[DIQ360]='1';
update dshokeen.mt1
set[DIQ360] ='1-12 months' where[DIQ360]='2';
update dshokeen.mt1
set[DIQ360]= '13-24 months' where[DIQ360] ='3';
update dshokeen.mt1
set[DIQ360]='Greater than 2 years' where[DIQ360]='4';
update dshokeen.mt1
set[DIQ360] ='Never' where[DIQ360]='5';
update dshokeen.mt1
set[DIQ360]= 'Donot know' where[DIQ360] ='9';
sp_rename '[dshokeen].[mt1].[DIQ360]', 'PUPILS DILATED[LAST TIME]', 'COLUMN';

--altering diq080
ALTER TABLE dshokeen.mt1
ALTER COLUMN [DIQ080] nvarchar(max);
update dshokeen.mt1
set[DIQ080] ='Yes' where [DIQ080]='1';
update dshokeen.mt1
set [DIQ080]= 'No' where [DIQ080]='2';
update dshokeen.mt1
set[DIQ080]='Refused' where[DIQ080]='7';
update dshokeen.mt1
set [DIQ080] ='Donot know' where [DIQ080]='9';
sp_rename '[dshokeen].[mt1].[DIQ080]', 'EYES_AFFECTED/RETINO', 'COLUMN';

select * from dshokeen.mt1
--we can also convert coloumns names from A to X for the reasons to make it more easier for further coding for statistical analysis like I have showed in r.
--I didn't remove most of the null values or imputed them for means or median because I believe we can lose informational data from the table. If we just want to run specific coloumns for statistical analysis, we can convert into numeric values and convert NULL values to 0 for that specific time



select count([SEQN]) from [dshokeen].[mt1]
--9575
select count('FEET CHECKED LAST YEAR[DOCTOR]) from [dshokeen].[mt1]
--9575
  
