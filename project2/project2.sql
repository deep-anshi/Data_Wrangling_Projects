
---Ques1---
select * into dshokeen.hw2 FROM qbs181.dbo.PhoneCall
alter table dshokeen.hw2
add EnrollmentGroup nvarchar(50);
update dshokeen.hw2
set EnrollmentGroup='Clinical Alert' where EncounterCode='125060000';
update dshokeen.hw2
set EnrollmentGroup='Health Coaching' where EncounterCode='125060001';
update dshokeen.hw2
set EnrollmentGroup='Technixal Question' where EncounterCode='125060002';
update dshokeen.hw2
set EnrollmentGroup='Administrative' where EncounterCode='125060003';
update dshokeen.hw2
set EnrollmentGroup='Other' where EncounterCode='125060004';
update dshokeen.hw2
set EnrollmentGroup='Lack of engagement ' where EncounterCode='125060005';
select * from dshokeen.hw2

---Ques2---

select count(*) from dshokeen.hw2 where EnrollmentGroup ='Clinical Alert';
--453

select count(*) from dshokeen.hw2 where EnrollmentGroup ='Health Coaching';
--409

select count(*) from dshokeen.hw2 where EnrollmentGroup ='Technixal Question';
--1059

select count(*) from dshokeen.hw2 where EnrollmentGroup ='Administrative';
--4480
select count(*) from dshokeen.hw2 where EnrollmentGroup ='Other';
--189

select count(*) from dshokeen.hw2 where EnrollmentGroup ='Lack of engagement';
--1824

---Ques3---
select A.*,B.* from qbs181.dshokeen.hw2 A
inner JOIN
qbs181.dbo.CallDuration B
on A.CustomerId=B.tri_CustomerIDEntityReference
select * from dshokeen.hw2


---Ques4---
select count(*) 
from qbs181.dshokeen.hw2 A
inner JOIN
qbs181.dbo.CallDuration B
on A.CustomerId=B.tri_CustomerIDEntityReference
where CallType ='1';
-- Number of inbound calls = 9872

select count(*) 
from qbs181.dshokeen.hw2 A
inner JOIN
qbs181.dbo.CallDuration B
on A.CustomerId=B.tri_CustomerIDEntityReference
where CallType ='2';
-- Number of outbound calls = 832

select count(*) 
from qbs181.dshokeen.hw2 A
inner JOIN
qbs181.dbo.CallDuration B
on A.CustomerId=B.tri_CustomerIDEntityReference
where CallOutcome ='1';
-- Number of No responses = 5201

select count(*) 
from qbs181.dshokeen.hw2 A
inner JOIN
qbs181.dbo.CallDuration B
on A.CustomerId=B.tri_CustomerIDEntityReference
where CallOutcome ='2';
-- Number of voice mails left = 4739

select count(*) 
from qbs181.dshokeen.hw2 A
inner JOIN
qbs181.dbo.CallDuration B
on A.CustomerId=B.tri_CustomerIDEntityReference
where CallOutcome ='3';
--Number of successful call outcome = 764

select sum(CallDuration) as "Total Call Duration for Clinical Alert"
from qbs181.dshokeen.hw2 A
inner JOIN
qbs181.dbo.CallDuration B
on A.CustomerId=B.tri_CustomerIDEntityReference
where EnrollmentGroup='Clinical Alert';
--268958

select sum(CallDuration) as "Total Call Duration for Health Coaching"
from qbs181.dshokeen.hw2 A
inner JOIN
qbs181.dbo.CallDuration B
on A.CustomerId=B.tri_CustomerIDEntityReference
where EnrollmentGroup='Health Coaching ';
--267033

select sum(CallDuration) as "Total Call Duration for Technixal Question"
from qbs181.dshokeen.hw2 A
inner JOIN
qbs181.dbo.CallDuration B
on A.CustomerId=B.tri_CustomerIDEntityReference
where EnrollmentGroup='Technixal Question';
--442126

select sum(CallDuration) as "Total Call Duration for Administrative"
from qbs181.dshokeen.hw2 A
inner JOIN
qbs181.dbo.CallDuration B
on A.CustomerId=B.tri_CustomerIDEntityReference
where EnrollmentGroup='Administrative';
--708638

select sum(CallDuration) as "Total Call Duration for Other"
from qbs181.dshokeen.hw2 A
inner JOIN
qbs181.dbo.CallDuration B
on A.CustomerId=B.tri_CustomerIDEntityReference
where EnrollmentGroup='Other';
--200487

select sum(CallDuration) as "Total Call Duration for Lack of engagement"
from qbs181.dshokeen.hw2 A
inner JOIN
qbs181.dbo.CallDuration B
on A.CustomerId=B.tri_CustomerIDEntityReference
where EnrollmentGroup='Lack of engagement';
--380474

select * 
into dshokeen.hw2b
from qbs181.dbo.Demographics A
inner JOIN
qbs181.dbo.ChronicConditions B
on A.contactid=B.tri_patientid
inner JOIN
qbs181.dbo.[Text] C
on B.tri_patientid=C.tri_contactId



select * from dshokeen.hw2b

select distinct sendername from dshokeen.hw2b

select count(*) from dshokeen.hw2b where  SenderName='System'--will give you total number of texts
--50648
select Max(TextSentDate) from dshokeen.hw2b where SenderName='System'
--2017-02-03 00:00:00
select Min(TextSentDate) from dshokeen.hw2b where SenderName='System'
--2016-03-21 00:00:00

select datediff(wk,'2016-03-21 00:00:00','2017-02-03 00:00:00')
--45
--50648/45 = 1125.5


select count(*) from dshokeen.hw2b where  SenderName='Clinician'--will give you total number of texts
--17589
select Max(TextSentDate) from dshokeen.hw2b where SenderName='Clinician'
--2017-02-03 00:00:00
select Min(TextSentDate) from dshokeen.hw2b where SenderName='Clinician'
--2016-02-07 00:00:00

select datediff(wk,'2016-02-07 00:00:00','2017-02-03 00:00:00')
--51

--17589/51= 344.88

select count(*) from dshokeen.hw2b where SenderName='Customer'--will give you total number of texts
--13712
select Max(TextSentDate) from dshokeen.hw2b where SenderName='Customer'
--2017-02-03 00:00:00
select Min(TextSentDate) from dshokeen.hw2b where SenderName='Customer'
--2016-03-01 00:00:00
select datediff(wk,'2016-03-01 00:00:00','2017-02-03 00:00:00')
--48
--13712/48= 285.66


---Ques 6---

select distinct(tri_name)  from dshokeen.hw2b
select * from dshokeen.hw2b

select count(*) from dshokeen.hw2b where  tri_name='Activity Monitoring'--will give you total number of texts
--56597
select Max(TextSentDate) from dshokeen.hw2b where tri_name='Activity Monitoring'
--2017-02-03 00:00:00
select Min(TextSentDate) from dshokeen.hw2b where tri_name='Activity Monitoring'
--2016-02-07 00:00:00

select datediff(wk,'2016-02-07 00:00:00','2017-02-03 00:00:00')
--51
--56597/51= 1109.74


select count(*) from dshokeen.hw2b where  tri_name='COPD'--will give you total number of texts
--3008
select Max(TextSentDate) from dshokeen.hw2b where tri_name='COPD'
--2017-02-03 00:00:00
select Min(TextSentDate) from dshokeen.hw2b where tri_name='COPD'
--2016-03-03 00:00:00

select datediff(wk,'2016-03-03 00:00:00','2017-02-03 00:00:00')
--48
--3008/48= 62.66


select count(*) from dshokeen.hw2b where  tri_name='Diabetes'--will give you total number of texts
--4460
select Max(TextSentDate) from dshokeen.hw2b where tri_name='Diabetes'
--2017-02-03 00:00:00
select Min(TextSentDate) from dshokeen.hw2b where tri_name='Diabetes'
--2016-03-07 00:00:00

select datediff(wk,'2016-03-07 00:00:00','2017-02-03 00:00:00')
--47
--4460/47= 94.89


select count(*) from dshokeen.hw2b where  tri_name='Hypertension'--will give you total number of texts
--15279
select Max(TextSentDate) from dshokeen.hw2b where tri_name='Hypertension'
--2017-02-03 00:00:00
select Min(TextSentDate) from dshokeen.hw2b where tri_name='Hypertension'
--2016-03-02 00:00:00

select datediff(wk,'2016-03-02 00:00:00','2017-02-03 00:00:00')
--48
--15279/48= 318.31

select count(*) from dshokeen.hw2b where  tri_name='Congestive Heart Failure'--will give you total number of texts
--2605
select Max(TextSentDate) from dshokeen.hw2b where tri_name='Congestive Heart Failure'
--2017-02-03 00:00:00
select Min(TextSentDate) from dshokeen.hw2b where tri_name='Congestive Heart Failure'
--2016-03-15 00:00:00

select datediff(wk,'2016-03-15 00:00:00','2017-02-03 00:00:00')
--46
--2605/46= 56.63

