# 1.Query the existence of 1 course
SELECT * FROM `course` where id = 1;
# 2.Query the presence of both 1 and 2 courses
SELECT * FROM `course` where id = 1 or id = 2;
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select b.studentId, a.name, Avg(b.score) average
from student a, student_course b
where a.id = b.studentId
GROUP BY b.studentId HAVING avg(b.score) >= 60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student
where id not in (
	select studentId from student_course
)
# 5.Query all SQL with grades
select * from student
where id in (
	select studentId FROM student_course
	GROUP BY studentId
)
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select * from student
where student.id in 
(select studentId 
from student_course
where studentId in (
	select studentId 
	from student_course
	where courseId = 2
)
AND
courseId = 1);
# 7.Retrieve 1 student score with less than 60 scores in descending order
select b.*
from student_course a, student b
where score < 60
AND
a.studentId = b.id
AND
a.courseId = 1
ORDER BY score DESC
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT courseId, AVG(score) average
FROM student_course
GROUP BY courseId
ORDER BY average DESC, courseId ASC;
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select a.name, b.score
from student a, student_course b, course c
where c.name = 'Math' AND b.courseId = c.id And a.id = b.studentId AND b.score < 60