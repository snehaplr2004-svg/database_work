create database education_db;
use education_db;

create table course(course_id int auto_increment primary key,
					course_name varchar(20) not null unique,
                    duration varchar(30),
                    fee int );

create table student(student_id int auto_increment primary key,
					student_name varchar(20) not null,
                    email varchar(30) unique,
                    age int,
                    gender enum("Male","Female"),
                    mark int,
                    courseid int ,
                    foreign key (courseid) references course(course_id));                    
insert into course(course_id,course_name,duration,fee)values
					(100,"Python development","6 months",50000),
                    (101,"Testing","5 months",45000),
                    (102,"AI","7 months",80000);
insert into student(student_id,student_name,email,age,gender,mark,courseid) values
					(1,"Arun","arun@gmail.com",23,"Male",85,100),
					(2,"Arjun","arjun@gmail.com",18,"Male",70,100),
                    (3,"Veena","veena@gmail.com",17,"Female",90,101);
insert into student(student_id,student_name,email,age,gender,mark,courseid) values
					(5,"Tom","tom@gmail.com",15,"Male",60,100),
                    (6,"Madhu","madhu@gmail.com",22,"Female",82,101);
select * from student;
select * from course;
1. Write a query to display all students who scored more than *80 marks, ordered by mark in descending order.
select * from student where mark>80 order by mark desc;

2. Write a query to find the highest mark, lowest mark, and average mark of all students.
select max(mark),min(mark),avg(mark) from student;

3. Write a query to display the top 5 students based on their marks.
select * from student order by mark desc limit 5;

4. Write a query to display the names and marks of students whose age is between 18 and 25, ordered by age.
select student_name,mark from student where age between 18 and 25 order by age;

5. Write a query to find the number of students in each course.
select course_name,count(*) from course inner join student on course.course_id=student.courseid group by course_id;

6. Write a query to display the courses that have more than 2 students.
select course_name from course inner join student on course.course_id=student.courseid group by courseid having count(*)>2 ;

7. Write a query to display the student name, mark, and course name using an `INNER JOIN`.
select student_name,mark,course_name from student inner join course on student.courseid=course.course_id;

8. Write a query to display all courses and their students, including courses that have no students, using a `LEFT JOIN`.
select course_name,student_name from course left join student on student.courseid=course.course_id;

9. Write a query to display students whose marks are greater than the overall average mark using a subquery.
select * from student where mark>(select avg(mark) from student);

10. Write a query to find the second-highest mark and display the student name, mark, and course name using a subquery and `JOIN`.
select student_name,mark,course_name from course inner join student on course.course_id=student.courseid where mark<(select max(mark) from student) order by mark desc limit 1;