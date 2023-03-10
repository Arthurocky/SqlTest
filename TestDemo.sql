
#1.查询“某1”课程比“某2”课程成绩高的所有学生的学号；
SELECT a.sid FROM (SELECT sid,score FROM SC WHERE cid=1) as a,(SELECT sid,score FROM SC WHERE cid=3) as b WHERE a.score>b.score AND a.sid=b.sid;
SELECT A.SID FROM (SELECT Sid,score FROM sc WHERE Cid = 1 ) AS A, (SELECT Sid, score FROM sc WHERE Cid = 2) AS B WHERE A.score>B.score AND A.Sid=B.score;
#此题知识点，嵌套查询和给查出来的表起别名

#2.查询平均成绩大于60分的同学的学号和平均成绩；
SELECT test.sc.Sid,avg(sc.score) FROM test.sc GROUP BY sid having avg(score) >60;
#此题知识点，GROUP BY 语句用于结合合计函数，根据一个或多个列对结果集进行分组。group by后面不能接where，having代替了where

#3.查询所有同学的学号、姓名、选课数、总成绩
#ERROR
select sid, sname, Cname from (select sc.Sid from sc) as a,(select student.Sname from student) as b ,(select course.Cname from course) as c RIGHT JOIN SC;
#ERRPR
SELECT student.SID ,student.SNAME,COUNT(SC.CID) , SUM(sc.score) FROM student LEFT Outer JOIN SC on Student.sid=SC.cid GROUP BY Student.sid,Sname;

SELECT student.SID ,student.SNAME,COUNT(SC.CID) , SUM(sc.score) FROM student LEFT JOIN sc ON student.Sid= SC.Sid GROUP BY student.SID, student.SNAME;

#4.查询姓“李”的老师的个数；
SELECT COUNT(teacher.TID) FROM teacher WHERE teacher.Tname LIKE '李%';

#5.查询没学过“叶平”老师课的同学的学号、姓名；
#张三
SELECT test.student.Sid , test.student.Sname FROM test.student WHERE Sid NOT IN (SELECT DISTINCT(test.student.Sid) FROM student,teacher,sc,course WHERE sc.Cid=course.Cid AND course.Tid = teacher.Tid AND teacher.Tname = '张三') ;
#叶平
select test.student.Sid , test.student.Sname from student where Sid not in (select distinct(test.sc.Sid) from test.sc,test.teacher,test.course where test.sc.Cid=course.Cid and teacher.Tid=course.Tid and teacher.Tname='叶平');
#  此题知识点，distinct是去重的作用

#6.查询学过“```”并且也学过编号“```”课程的同学的学号、姓名；
SELECT student.SID , student.SNAME FROM (SELECT Cid FROM course WHERE Cid = 01 AND CID = 02 )

select a.SID,a.SNAME from (select student.SNAME,student.SID from student,course,sc where cname='c++'and sc.sid=student.sid and sc.cid=course.cid) a,
                          (select student.SNAME,student.SID from student,course,sc where cname='english'and sc.sid=student.sid and sc.cid=course.cid) b where a.sid=b.sid;
标准答案（但是好像不好使）SELECT Student.S#,Student.Sname FROM Student,SC WHERE Student.S#=SC.S# AND SC.C#='001'and exists( SELECT * FROM SC as SC_2 WHERE SC_2.S#=SC.S# AND SC_2.C#='002');
此题知识点，exists是在集合里找数据，as就是起别名