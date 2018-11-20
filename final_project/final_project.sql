--Finals
--Q1a
select * into dshokeen.finals from  qbs181.dshokeen.IC_BP
sp_rename 'dshokeen.finals.BPAlerts', 'BP status', 'COLUMN'
select * from dshokeen.finals

--Q1b
update qbs181.dshokeen.finals
set [BP status] = 'Controlled blood pressure' where [BP status] = 'Hypo1' or [BP status] = 'Normal'
update qbs181.dshokeen.finals
set [BP status] = 'Uncontrolled blood pressure' where [BP status] = 'HTN1' or [BP status] = 'Hypo2' or [BP status] = 'HTN3' or [BP status] = 'HTN2'


update qbs181.dshokeen.finals
set [BP status] = 1 where [BP status] = 'Controlled blood pressure' 
update qbs181.dshokeen.finals
set [BP status] = 0 where [BP status] = 'Uncontrolled blood pressure'
select * from demographics

--Q1c


select A.*,B.* from qbs181.dshokeen.finals A
inner JOIN
qbs181.dbo.Demographics B
on A.id=B.contactid
select * from dshokeen.finals


--Q1d
--create a 12 week interval of average scores of each customer

-- joining demographics and finals which includes bp status in 0 or 1
select * into dshokeen.bsdemo1 from demographics
INNER JOIN dshokeen.finals on demographics.contactid = dshokeen.finals.id
select top 10 * from qbs181.dshokeen.bsdemo1

--using order by
select contactid, observedtime, [BP status] into dshokeen.a
from dshokeen.bsdemo1
order by contactid, ObservedTime
select top 10 * from qbs181.dshokeen.a


select contactid as distinctid,
min(observedtime) as mot into dshokeen.mot
from dshokeen.bsdemo1
group by contactid
select top 10 * from qbs181.dshokeen.mot


select * into dshokeen.wn from dshokeen.a
INNER JOIN dshokeen.mot on dshokeen.a.contactid = dshokeen.mot.distinctid
alter table dshokeen.wn add w_n nvarchar(max)
update dshokeen.wn
set w_n = datediff(week, mot, observedtime)
select top 10 * from qbs181.dshokeen.wn

--Error- Operand data type nvarchar is invalid for avg operator.
--so convert it to numerics
select avg(try_convert(numeric(7,7), [BP status])) as status_avg, contactid, w_n
into dshokeen.savg
from dshokeen.wn
group by w_n,contactid
select * from qbs181.dshokeen.savg


alter table dshokeen.savg add w1
ALTER TABLE dshokeen.savg ALTER COLUMN w1 numeric(20,20)
update dshokeen.savg
set w1 = status_avg where w_n = 1
alter table dshokeen.savg add w2 
ALTER TABLE dshokeen.savg ALTER COLUMN w2 numeric(20,20)
update dshokeen.savg
set w2 = status_avg where w_n = 2
alter table dshokeen.savg add w3 
ALTER TABLE dshokeen.savg ALTER COLUMN w3 numeric(20,20)
update dshokeen.savg
set w3 = status_avg where w_n = 3
alter table dshokeen.savg add w4 
ALTER TABLE dshokeen.savg ALTER COLUMN w4 numeric(20,20)
update dshokeen.savg
set w4 = status_avg where w_n = 4
alter table dshokeen.savg add w5 
ALTER TABLE dshokeen.savg ALTER COLUMN w5 numeric(20,20)
update dshokeen.savg
set w5 = status_avg where w_n = 5
alter table dshokeen.savg add w6 
ALTER TABLE dshokeen.savg ALTER COLUMN w6 numeric(20,20)
update dshokeen.savg
set w6 = status_avg where w_n = 6
alter table dshokeen.savg add w7
ALTER TABLE dshokeen.savg ALTER COLUMN w7 numeric(20,20)
update dshokeen.savg
set w7 = status_avg where w_n = 7
alter table dshokeen.savg add w8 
ALTER TABLE dshokeen.savg ALTER COLUMN w8 numeric(20,20)
update dshokeen.savg
set w8 = status_avg where w_n = 8
alter table dshokeen.savg add w9 
ALTER TABLE dshokeen.savg ALTER COLUMN w9 numeric(20,20)
update dshokeen.savg
set w9 = status_avg where w_n = 9
alter table dshokeen.savg add w10
ALTER TABLE dshokeen.savg ALTER COLUMN w10 numeric(20,20)
update dshokeen.savg
set w10 = status_avg where w_n = 10
alter table dshokeen.savg add w11 
ALTER TABLE dshokeen.savg ALTER COLUMN w11 numeric(20,20)
update dshokeen.savg
set w11 = status_avg where w_n = 11
alter table dshokeen.savg add w12 
ALTER TABLE dshokeen.savg ALTER COLUMN w12 numeric(20,20)
update dshokeen.savg
set w12 = status_avg where w_n = 12


select contactid,
avg(w1) as week1,avg(w2) as week2,avg(w3) as week3,avg(w4) as week4,avg(w5) as week5,avg(w6) as week6,avg(w7) as week7,avg(w8) as week8,avg(w9) as week9,avg(w10) as week10,avg(w11) as week11,avg(w12) as week12
into dshokeen.each_patient
from dshokeen.savg
group by contactid
select * from dshokeen.each_patient


--Q1e 
--to compare we can find the difference between the differences and treat week 1 as baseline
select contactid, week1, week12 into dshokeen.parte
from dshokeen.each_patient
alter table dshokeen.parte add e_diff numeric(36,36)
update dshokeen.parte
set e_diff = week12 - week1
select top 10 * from dshokeen.parte


--Q1f
--have changed w_n from nvarchar to numeric so it wont throw an error later on
ALTER TABLE qbs181.dshokeen.wn ALTER COLUMN w_n numeric

select contactid, [BP status], w_n into dshokeen.fpart 
from qbs181.dshokeen.wn 
-- creating coloumn a 
alter table dshokeen.fpart add a nvarchar(max)
update dshokeen.fpart
set a= 1  where [BP status] = 0 and w_n < 13
--creating coloumn b
alter table dshokeen.fpart add b nvarchar(max)
update dshokeen.fpart
set b=1 where [BP status] = 1 and w_n > 13 
-- we have created these two coloumns so we can check for both the conditions that is customers  were  brought  from  uncontrolled  regime  to controlled regime after 12 weeks of intervention
count (distinct contactid) where a=1 and b=1



