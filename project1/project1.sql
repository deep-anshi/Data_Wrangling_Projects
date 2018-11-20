--Question 1--
select * into dshokeen.hw1 from demographics
sp_rename 'dshokeen.hw1.tri_age', 'age', 'COLUMN';
sp_rename 'dshokeen.hw1.gendercode', 'gender', 'COLUMN';
sp_rename 'dshokeen.hw1.contactid', 'ID', 'COLUMN';
sp_rename 'dshokeen.hw1.address1_stateorprovince', 'state', 'COLUMN';
sp_rename 'dshokeen.hw1.tri_imaginecareenrollmentemailsentdate', 'EmailSentDate', 'COLUMN';
sp_rename 'dshokeen.hw1.tri_enrollmentcompletedate', 'CompleteDate', 'COLUMN';
alter table dshokeen.hw1
add [time took to complete enrollment] as datediff(day,try_convert(date,EmailSentDate), 
try_convert(date,CompleteDate))

--Question2--
alter table dshokeen.hw1
add [Enrollment Status] nvarchar(50);
update dshokeen.hw1
set [Enrollment Status] ='Status=Complete' where tri_imaginecareenrollmentstatus=167410011;
update dshokeen.hw1
set [Enrollment Status] ='Status=Email sent' where tri_imaginecareenrollmentstatus=167410001;
update dshokeen.hw1
set [Enrollment Status] ='Status=Non responder' where tri_imaginecareenrollmentstatus=167410004;
update dshokeen.hw1
set [Enrollment Status] ='Status=Facilitated Enrollment' where tri_imaginecareenrollmentstatus=167410005;
update dshokeen.hw1
set [Enrollment Status] ='Status=Incomplete Enrollments' where tri_imaginecareenrollmentstatus=167410002;
update dshokeen.hw1
set [Enrollment Status] ='Status=Opted Out' where tri_imaginecareenrollmentstatus=167410003;
update dshokeen.hw1
set [Enrollment Status] ='Status=Unprocessed' where tri_imaginecareenrollmentstatus=167410000;
update dshokeen.hw1
set [Enrollment Status] ='Status=Second email sent' where tri_imaginecareenrollmentstatus=167410006;

--Question3--

alter table dshokeen.hw1
add Sex nvarchar(25);
update dshokeen.hw1
set Sex='female' where gender='2';
update dshokeen.hw1
set Sex='male' where gender='1';
update dshokeen.hw1
set Sex='other' where gender='167410000';
update dshokeen.hw1
set Sex='unknown' where gender='NULL';


--Question 4--
alter table dshokeen.hw1
add [age group] nvarchar(50);
update dshokeen.hw1
set [age group]='0-25' where age>0 and age<26;
update dshokeen.hw1
set [age group]='26-50' where age>25 and age<51;
update dshokeen.hw1
set [age group]='51-75' where age>50 and age<76;
update dshokeen.hw1
set [age group]='76-100' where age>75 and age<101;


--Calling the tables--

--call1--
select ID, gender, age, state, EmailSentDate, CompleteDate, [time took to complete enrollment], [Enrollment Status] , Sex, [age group] from dshokeen.hw1

--call2--
select*from dshokeen.hw1



