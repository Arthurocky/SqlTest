#学生表Student(Sid,Sname,Sage,Ssex)
truncate student;
create table Student(Sid varchar(10), Sname nvarchar(10), Sage datetime,Ssex nvarchar(10));
insert into Student values('01' , N'赵雷' , '1990-01-01' , N'男');
insert into Student values('02' , N'钱电' , '1990-12-21' , N'男');
insert into Student values('03' , N'孙风' , '1990-05-20' , N'男');
insert into Student values('04' , N'李云' , '1990-08-06' , N'男');
insert into Student values('05' , N'周梅' , '1991-12-01' , N'女');
insert into Student values('06' , N'吴兰' , '1992-03-01' , N'女');
insert into Student values('07' , N'郑竹' , '1989-07-01' , N'女');
insert into Student values('08' , N'王菊' , '1990-01-20' , N'女');
#删除空值
DELETE FROM test.Student WHERE Sid IS NULL AND Sname IS NULL AND Sage IS NULL AND Ssex IS NULL;
DELETE
FROM test.Student
WHERE (test.Student.Sid IS NULL or Sid = '' or test.Student.Sname IS NULL or Sname = '' or test.Student.Sage IS NULL or
       test.Student.Ssex = '' or Ssex IS NULL);
select * from Student;


#课程表Course(Cid,Cname,Tid)
create table Course(Cid varchar(10),Cname nvarchar(10),Tid varchar(10));
insert into Course values('01' , N'语文' , '02');
insert into Course values('02' , N'数学' , '01');
insert into Course values('03' , N'英语' , '03');
Delete from Course where course.Tid is null or course.Tid = '';
select Cname as ClassName, Cid as id from Course;

#老师表Teacher(Tid,Tname)
create table Teacher(Tid varchar(10),Tname nvarchar(10));
insert into Teacher values('01' , N'张三');
insert into Teacher values('02' , N'李四');
insert into Teacher values('03' , N'王五');
select * from teacher;
DELETE FROM test.teacher WHERE Tid IS NULL or Tid = '' or Tname IS NULL or Tname = '';

#成绩表 SC(Sid,Cid,score)
create table Sc(Sid Varchar(10),Cid Varchar(10),score decimal(18,1));
insert into SC values('01' , '01' , 80);
insert into SC values('01' , '02' , 90);
insert into SC values('01' , '03' , 99);
insert into SC values('02' , '01' , 70);
insert into SC values('02' , '02' , 60);
insert into SC values('02' , '03' , 80);
insert into SC values('03' , '01' , 80);
insert into SC values('03' , '02' , 80);
insert into SC values('03' , '03' , 80);
insert into SC values('04' , '01' , 50);
insert into SC values('04' , '02' , 30);
insert into SC values('04' , '03' , 20);
insert into SC values('05' , '01' , 76);
insert into SC values('05' , '02' , 87);
insert into SC values('06' , '01' , 31);
insert into SC values('06' , '03' , 34);
insert into SC values('07' , '02' , 89);
insert into SC values('07' , '03' , 98);
DELETE FROM SC WHERE SC.Cid IS NULL OR SC.Cid = '' OR SC.score IS NULL OR SC.score = '' OR SC.Sid IS NULL  OR SC.score = '';