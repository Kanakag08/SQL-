create database SIS;
Use SIS;

create table Students
(
student_id int primary key,
first_name varchar(50),
last_name varchar(50),
date_of_birth date,
email varchar(50),
phone_number int
);

insert into Students(student_id,first_name,last_name,date_of_birth,email,phone_number)
values 
(1,'Arjit','Singh','1998-10-20','arjit@ex.com',555-123-0025),
 (2,'Sakshi','Bang','1995-10-25','sakshi@ex.com',567-123-0025),
 (3,'avi','Agrawal','2001-11-08','avi@ex.com',789-123-1122),
 (4,'Ram','Mishra','1976-02-06','ram@ex.com',453-089-7531),
 (5,'Tanisha','Parashar','2007-10-20','tanisha@ex.com',017-792-1855),
 (6,'Vivek','Sharma','2010-12-18','vivek@ex.com',555-123-0555),
 (7,'Anjali','ojha','2003-03-29','anjali@ex.com',582-123-9999),
 (8,'Shyam','Singh','1998-10-20','shyam@ex.com',129-120-111),
 (9,'Lucky','Patel','1990-11-20','lucky@ex.com',696-9630-2222),
 (10,'Nisha','Singh','2000-07-18','nisha@ex.com',785-030-0025);

 select * from Students

 --create table Courses
 create table Courses
 (
 course_id int primary key,
 course_name varchar(50),
 credits int,
 teacher_id int foreign key
 references Teachers(teacher_id)
 );

  insert into Courses(course_id,course_name,credits,teacher_id)
 values
 (1,'JAVA',4,1),
 (2,'Python',3,2),
 (3,'C++',5,3),
 (4,'Ruby',2,4),
 (5,'C',4,5),
 (6,'.NET',4,6),
 (7,'C#',6,7),
 (8,'SQL',5,8),
 (9,'MangoDB',1,9),
 (10,'PHP',3,10);

 
 select * from Courses

  --create table Enrollment
 create table Enrollments
 (
 enrollment_id int primary key,
 student_id int foreign key 
 references Students(student_id),
 course_id int foreign key
 references Courses(course_id),
 enrollment_date date
 );

 insert into Enrollments(enrollment_id,student_id,course_id,enrollment_date)
 values
 (1,1,1,'2023-01-10'),
 (2,2,2,'2023-02-20'),
 (3,3,3,'2023-03-30'),
 (4,4,4,'2023-04-11'),
 (5,5,5,'2023-05-22'),
 (6,6,6,'2023-06-05'),
 (7,7,7,'2023-07-15'),
 (8,8,8,'2023-08-25'),
 (9,9,9,'2023-09-02'),
 (10,10,10,'2023-10-04');

 select * from Enrollments

 --create table teachers
 create table Teachers
 (
 teacher_id int primary key,
 tfirst_name varchar(40),
 tlast_name varchar(40),
 temails varchar(50)
 );

 insert into Teachers(teacher_id,tfirst_name,tlast_name,temails)
 values
 (1,'sam','roy','sam@ex.com'),
 (2,'Sarah','saxesna','sarah@ex.com'),
 (3,'Max','MAxwell','max@ex.com'),
 (4,'Alex','Volvo','volvo@ex.com'),
 (5,'Ava','Paxton','ava@ex.com'),
 (6,'Andrew','Garfield','andrew@ex.com'),
 (7,'Wendy','Lee','wendy@ex.com'),
 (8,'Tom','Holland','tom@ex.com'),
 (9,'Peter','Parker','peter@ex.com'),
 (10,'Emma','Watson','emma@ex.com');

 
 select * from Teachers

 --create table payment
 create table Payments
 (
 payment_id int primary key,
 student_id int foreign key
 references Students(student_id),
 amount float,
 payment_date date
 );


 insert into Payments(payment_id,student_id,amount,payment_date)
 values
 
 (1,1,2000,'1990-10-02'),
 (2,2,1500,'1986-10-03'),
 (3,3,3000,'2001-11-08'),
 (4,4,3500,'1976-02-06'),
 (5,5,4000,'2007-06-04'),
 (6,6,1100,'2010-07-18'),
 (7,7,3300,'2003-03-29'),
 (8,8,3650,'2004-08-20'),
 (9,9,1200,'2001-11-20'),
 (10,10,6500,'2000-07-18');

 select * from Payments


--Questions 
--DML B
--1
Insert into Students(student_id,first_name,last_name,date_of_birth,email,phone_number)
values
(11,'John','Doe','1995-08-15','john.doe@example.com',1234567890);

--2
Insert into Enrollments(enrollment_id,student_id,course_id,enrollment_date)
Values
(11,11,2,'2023-12-01');


--3
Update Teachers 
set temails='samroy@example.com'
where teacher_id = 1;


--4
Delete from Enrollments
where student_id = 3 AND course_id = 3;
 --if @ROWCOUNT >8
--begin  print 'Enrollment record deleted successfully' ;

--5
UPDATE Courses
set teacher_id=6
where course_id=3;

--6
Delete from Enrollments
where enrollment_id = 2;

delete from Students
where student_id = 2;

select * from Enrollments
select * from Students

--7
update Payments
set amount=5000
where payment_id =1;

select * from Payments

--4 Joins 
--1
select
    S.student_id,
	S.first_name,
	S.last_name,
	SUM(P.amount) As TotalPayments
	from Students AS S
	join Payments As P
	on S.student_id=P.student_id
	group by S.first_name,S.last_name,S.student_id;

--2
select 
       C.course_id,
	   C.course_name,
	   count(E.course_id) AS TotalEnrollment
	   from  Courses as C
	   join Enrollments as E
	   on C.course_id=E.course_id
	   Group by C.course_id,C.course_name;

--3
select
   S.student_id,
   S.first_name,
   S.last_name
   from Students as S
   Left Join Enrollments as E
   on S.student_id=E.student_id
   Where E.student_id is null;

--4
select 
        S.first_name,
		S.last_name,
		C.course_name
		From Students As S
		Join Enrollments As E
		on S.student_id = E.student_id
		join Courses As C
		on C.course_id=E.course_id
		group by S.first_name,S.last_name,C.course_name;

--5
select 
         T.tfirst_name,
		 T.tlast_name,
		 C.course_name
		 From Teachers as T
		 join Courses As C
		 on T.teacher_id=C.teacher_id
		 group by T.tfirst_name,T.tlast_name,C.course_name;

--6
select 
       S.first_name,
	   S.last_name,
	   E.enrollment_date,
	   C.course_name
	   from Students As S
	   join Enrollments As E 
	   on S.student_id= E.student_id
	   join Courses As C
	   on C.course_id=E.course_id
	   group by 
	   S.first_name,S.last_name,C.course_name,E.enrollment_date;


--7
select 
          S.student_id,
          S.first_name,
		  S.last_name
From   Students As s
  Left Join Payments As P
  on S.student_id= P.student_id
  where P.student_id is null;


--8
select 
       C.course_id,
	   C.course_name
	   From Courses As C
	   left join Enrollments As E
	   on C.course_id= E.course_id
	   where E.course_id is null;

--9


--10
select 
        T.teacher_id,
        T.tfirst_name,
		T.tlast_name
		from Teachers as T
		Left join Courses As c
		on T.teacher_id=C.teacher_id
		where C.teacher_id is null; 

--Aggregate and subquery
--1
SELECT
    c.course_id,
    c.course_name,
    AVG(NumStudentsEnrolled) AS AverageStudentsEnrolled
FROM Courses c
LEFT JOIN
    (
        SELECT
            course_id,
            COUNT(DISTINCT student_id) AS NumStudentsEnrolled
        FROM
            Enrollments
        GROUP BY
            course_id
    ) e ON c.course_id = e.course_id
GROUP BY
    c.course_id, c.course_name;


--2
SELECT
    s.student_id,
    s.first_name,
	s.last_name,
    p.amount
FROM
    Students s
JOIN
    Payments p ON s.student_id = p.student_id
WHERE
    p.amount = (
        SELECT
            MAX(amount)
        FROM
            Payments
    );


--3
SELECT
    c.course_id,
    c.course_name,
    COUNT(e.enrollment_id) AS EnrollmentCount
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING
    COUNT(e.enrollment_id) = (
        SELECT MAX(EnrollmentCount)
        FROM
            (
                SELECT
                    course_id,
                    COUNT(enrollment_id) AS EnrollmentCount
                FROM Enrollments
                GROUP BY course_id
            ) AS CourseEnrollments
    );


--4
SELECT
    t.teacher_id,
    t.tfirst_name,
    SUM(p.amount) AS TotalPayments
FROM
    Teachers t
JOIN
    Courses c ON t.teacher_id = c.teacher_id
LEFT JOIN
    Enrollments e ON c.course_id = e.course_id
LEFT JOIN
    Payments p ON e.student_id = p.student_id
GROUP BY
    t.teacher_id, t.tfirst_name;


--5
SELECT
    s.student_id,
    s.first_name
FROM
    Students s
WHERE
    NOT EXISTS (
        SELECT
            c.course_id
        FROM
            Courses c
        WHERE
            NOT EXISTS (
                SELECT
                    e.enrollment_id
                FROM
                    Enrollments e
                WHERE
                    e.student_id = s.student_id AND e.course_id = c.course_id
            )
    );


--6
SELECT
    t.teacher_id,
    t.tfirst_name
FROM
    Teachers t
WHERE
    NOT EXISTS (
        SELECT 1
        FROM Courses c
        WHERE c.teacher_id = t.teacher_id
    );
	

--7
SELECT
    AVG(StudentAge) AS AverageAge
FROM (
    SELECT
        student_id,
        DATEDIFF(YEAR, date_of_birth, GETDATE()) AS StudentAge
    FROM
        Students
) AS StudentAges;

--8
SELECT
    c.course_id,
    c.course_name
FROM
    Courses c
WHERE
    NOT EXISTS (
        SELECT 1
        FROM Enrollments e
        WHERE e.course_id = c.course_id
    );


--9
SELECT
    e.student_id,
    e.course_id,
    SUM(p.amount) AS TotalPayments
FROM
    Enrollments e
LEFT JOIN
    Payments p ON e.student_id = p.student_id
GROUP BY
    e.student_id, e.course_id;



--10
SELECT
    s.student_id,
    s.first_name
FROM Students s
JOIN Payments p 
ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name
HAVING COUNT(p.payment_id) > 1;


--11
SELECT
    s.student_id,
    s.first_name,
    SUM(p.amount) AS TotalPayments
FROM
    Students s
LEFT JOIN
    Payments p ON s.student_id = p.student_id
GROUP BY
    s.student_id, s.first_name;


--12
SELECT
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS StudentCount
FROM Courses c
LEFT JOIN Enrollments e 
	ON c.course_id = e.course_id
GROUP BY  c.course_id, c.course_name;


--13
SELECT
    s.student_id,
    s.first_name,
    AVG(p.amount) AS AveragePaymentAmount
FROM Students s
LEFT JOIN Payments p 
ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name;
