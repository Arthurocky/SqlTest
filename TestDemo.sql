
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
