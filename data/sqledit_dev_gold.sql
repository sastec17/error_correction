SELECT email FROM user_profiles WHERE name  =  'Mary'	twitter_1
SELECT partitionid FROM user_profiles WHERE name  =  'Iron Man'	twitter_1
SELECT count(*) FROM user_profiles	twitter_1
SELECT count(*) FROM follows	twitter_1
SELECT count(*) FROM follows GROUP BY f1	twitter_1
SELECT count(*) FROM tweets	twitter_1
SELECT count(DISTINCT UID) FROM tweets	twitter_1
SELECT name ,  email FROM user_profiles WHERE name LIKE '%Swift%'	twitter_1
SELECT name FROM user_profiles WHERE email LIKE '%superstar%' OR email LIKE '%edu%'	twitter_1
SELECT text FROM tweets WHERE text LIKE '%intern%'	twitter_1
SELECT name ,  email FROM user_profiles WHERE followers  >  1000	twitter_1
SELECT T1.name FROM user_profiles AS T1 JOIN follows AS T2 ON T1.uid  =  T2.f1 GROUP BY T2.f1 HAVING count(*)  >  (SELECT count(*) FROM user_profiles AS T1 JOIN follows AS T2 ON T1.uid  =  T2.f1 WHERE T1.name  =  'Tyler Swift')	twitter_1
SELECT T1.name ,  T1.email FROM user_profiles AS T1 JOIN follows AS T2 ON T1.uid  =  T2.f1 GROUP BY T2.f1 HAVING count(*)  >  1	twitter_1
SELECT T1.name FROM user_profiles AS T1 JOIN tweets AS T2 ON T1.uid  =  T2.uid GROUP BY T2.uid HAVING count(*)  >  1	twitter_1
SELECT T2.f1 FROM user_profiles AS T1 JOIN follows AS T2 ON T1.uid  =  T2.f2 WHERE T1.name  =  "Mary" INTERSECT SELECT T2.f1 FROM user_profiles AS T1 JOIN follows AS T2 ON T1.uid  =  T2.f2 WHERE T1.name  =  "Susan"	twitter_1
SELECT T2.f1 FROM user_profiles AS T1 JOIN follows AS T2 ON T1.uid  =  T2.f2 WHERE T1.name  =  "Mary" OR T1.name  =  "Susan"	twitter_1
SELECT name FROM user_profiles ORDER BY followers DESC LIMIT 1	twitter_1
SELECT name ,  email FROM user_profiles ORDER BY followers LIMIT 1	twitter_1
SELECT name ,  followers FROM user_profiles ORDER BY followers DESC	twitter_1
SELECT name FROM user_profiles ORDER BY followers DESC LIMIT 5	twitter_1
SELECT text FROM tweets ORDER BY createdate	twitter_1
SELECT T1.name ,  count(*) FROM user_profiles AS T1 JOIN tweets AS T2 ON T1.uid  =  T2.uid GROUP BY T2.uid	twitter_1
SELECT T1.name ,  T1.partitionid FROM user_profiles AS T1 JOIN tweets AS T2 ON T1.uid  =  T2.uid GROUP BY T2.uid HAVING count(*)  <  2	twitter_1
SELECT T1.name ,  count(*) FROM user_profiles AS T1 JOIN tweets AS T2 ON T1.uid  =  T2.uid GROUP BY T2.uid HAVING count(*)  >  1	twitter_1
SELECT avg(followers) FROM user_profiles WHERE UID NOT IN (SELECT UID FROM tweets)	twitter_1
SELECT avg(followers) FROM user_profiles WHERE UID IN (SELECT UID FROM tweets)	twitter_1
SELECT max(followers) ,  sum(followers) FROM user_profiles	twitter_1
SELECT DISTINCT building FROM classroom WHERE capacity  >  50	college_2
SELECT DISTINCT building FROM classroom WHERE capacity  >  50	college_2
SELECT count(*) FROM classroom WHERE building != 'Lamberton'	college_2
SELECT count(*) FROM classroom WHERE building != 'Lamberton'	college_2
SELECT dept_name ,  building FROM department WHERE budget  >  (SELECT avg(budget) FROM department)	college_2
SELECT dept_name ,  building FROM department WHERE budget  >  (SELECT avg(budget) FROM department)	college_2
SELECT building ,  room_number FROM classroom WHERE capacity BETWEEN 50 AND 100	college_2
SELECT building ,  room_number FROM classroom WHERE capacity BETWEEN 50 AND 100	college_2
SELECT dept_name ,  building FROM department ORDER BY budget DESC LIMIT 1	college_2
SELECT dept_name ,  building FROM department ORDER BY budget DESC LIMIT 1	college_2
SELECT name FROM student WHERE dept_name  =  'History' ORDER BY tot_cred DESC LIMIT 1	college_2
SELECT name FROM student WHERE dept_name  =  'History' ORDER BY tot_cred DESC LIMIT 1	college_2
SELECT count(*) FROM classroom WHERE building  =  'Lamberton'	college_2
SELECT count(*) FROM classroom WHERE building  =  'Lamberton'	college_2
SELECT count(DISTINCT s_id) FROM advisor	college_2
SELECT count(DISTINCT s_id) FROM advisor	college_2
SELECT count(DISTINCT dept_name) FROM course	college_2
SELECT count(DISTINCT dept_name) FROM course	college_2
SELECT count(DISTINCT course_id) FROM course WHERE dept_name  =  'Physics'	college_2
SELECT count(DISTINCT course_id) FROM course WHERE dept_name  =  'Physics'	college_2
SELECT T1.title FROM course AS T1 JOIN prereq AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  =  2	college_2
SELECT T1.title FROM course AS T1 JOIN prereq AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  =  2	college_2
SELECT T1.title ,  T1.credits , T1.dept_name FROM course AS T1 JOIN prereq AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  >  1	college_2
SELECT T1.title ,  T1.credits , T1.dept_name FROM course AS T1 JOIN prereq AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  >  1	college_2
SELECT count(*) FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)	college_2
SELECT count(*) FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)	college_2
SELECT title FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)	college_2
SELECT title FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)	college_2
SELECT COUNT (DISTINCT id) FROM teaches	college_2
SELECT COUNT (DISTINCT id) FROM teaches	college_2
SELECT sum(budget) FROM department WHERE dept_name  =  'Marketing' OR dept_name  =  'Finance'	college_2
SELECT sum(budget) FROM department WHERE dept_name  =  'Marketing' OR dept_name  =  'Finance'	college_2
SELECT dept_name FROM instructor WHERE name LIKE '%Soisalon%'	college_2
SELECT dept_name FROM instructor WHERE name LIKE '%Soisalon%'	college_2
SELECT count(*) FROM classroom WHERE building  =  'Lamberton' AND capacity  <  50	college_2
SELECT count(*) FROM classroom WHERE building  =  'Lamberton' AND capacity  <  50	college_2
SELECT dept_name ,  budget FROM department WHERE budget  >  (SELECT avg(budget) FROM department)	college_2
SELECT dept_name ,  budget FROM department WHERE budget  >  (SELECT avg(budget) FROM department)	college_2
SELECT name FROM instructor WHERE dept_name  =  'Statistics' ORDER BY salary LIMIT 1	college_2
SELECT name FROM instructor WHERE dept_name  =  'Statistics' ORDER BY salary LIMIT 1	college_2
SELECT title FROM course WHERE dept_name  =  'Statistics' INTERSECT SELECT title FROM course WHERE dept_name  =  'Psychology'	college_2
SELECT title FROM course WHERE dept_name  =  'Statistics' INTERSECT SELECT title FROM course WHERE dept_name  =  'Psychology'	college_2
SELECT title FROM course WHERE dept_name  =  'Statistics' EXCEPT SELECT title FROM course WHERE dept_name  =  'Psychology'	college_2
SELECT title FROM course WHERE dept_name  =  'Statistics' EXCEPT SELECT title FROM course WHERE dept_name  =  'Psychology'	college_2
SELECT id FROM teaches WHERE semester  =  'Fall' AND YEAR  =  2009 EXCEPT SELECT id FROM teaches WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT id FROM teaches WHERE semester  =  'Fall' AND YEAR  =  2009 EXCEPT SELECT id FROM teaches WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT DISTINCT T1.name FROM student AS T1 JOIN takes AS T2 ON T1.id  =  T2.id WHERE YEAR  =  2009 OR YEAR  =  2010	college_2
SELECT DISTINCT T1.name FROM student AS T1 JOIN takes AS T2 ON T1.id  =  T2.id WHERE YEAR  =  2009 OR YEAR  =  2010	college_2
SELECT dept_name FROM course GROUP BY dept_name ORDER BY count(*) DESC LIMIT 3	college_2
SELECT dept_name FROM course GROUP BY dept_name ORDER BY count(*) DESC LIMIT 3	college_2
SELECT dept_name FROM course GROUP BY dept_name ORDER BY sum(credits) DESC LIMIT 1	college_2
SELECT dept_name FROM course GROUP BY dept_name ORDER BY sum(credits) DESC LIMIT 1	college_2
SELECT title FROM course ORDER BY title ,  credits	college_2
SELECT title FROM course ORDER BY title ,  credits	college_2
SELECT dept_name FROM department ORDER BY budget LIMIT 1	college_2
SELECT dept_name FROM department ORDER BY budget LIMIT 1	college_2
SELECT dept_name ,  building FROM department ORDER BY budget DESC	college_2
SELECT dept_name ,  building FROM department ORDER BY budget DESC	college_2
SELECT name FROM instructor ORDER BY salary DESC LIMIT 1	college_2
SELECT name FROM instructor ORDER BY salary DESC LIMIT 1	college_2
SELECT * FROM instructor ORDER BY salary	college_2
SELECT * FROM instructor ORDER BY salary	college_2
SELECT name ,  dept_name FROM student ORDER BY tot_cred	college_2
SELECT name ,  dept_name FROM student ORDER BY tot_cred	college_2
SELECT T1.title ,  T3.name FROM course AS T1 JOIN teaches AS T2 ON T1.course_id  =  T2.course_id JOIN instructor AS T3 ON T2.id  =  T3.id WHERE YEAR  =  2008 ORDER BY T1.title	college_2
SELECT T1.title ,  T3.name FROM course AS T1 JOIN teaches AS T2 ON T1.course_id  =  T2.course_id JOIN instructor AS T3 ON T2.id  =  T3.id WHERE YEAR  =  2008 ORDER BY T1.title	college_2
SELECT T1.name FROM instructor AS T1 JOIN advisor AS T2 ON T1.id  =  T2.i_id GROUP BY T2.i_id HAVING count(*)  >  1	college_2
SELECT T1.name FROM instructor AS T1 JOIN advisor AS T2 ON T1.id  =  T2.i_id GROUP BY T2.i_id HAVING count(*)  >  1	college_2
SELECT T1.name FROM student AS T1 JOIN advisor AS T2 ON T1.id  =  T2.s_id GROUP BY T2.s_id HAVING count(*)  >  1	college_2
SELECT T1.name FROM student AS T1 JOIN advisor AS T2 ON T1.id  =  T2.s_id GROUP BY T2.s_id HAVING count(*)  >  1	college_2
SELECT count(*) ,  building FROM classroom WHERE capacity  >  50 GROUP BY building	college_2
SELECT count(*) ,  building FROM classroom WHERE capacity  >  50 GROUP BY building	college_2
SELECT max(capacity) ,  avg(capacity) ,  building FROM classroom GROUP BY building	college_2
SELECT max(capacity) ,  avg(capacity) ,  building FROM classroom GROUP BY building	college_2
SELECT title FROM course GROUP BY title HAVING count(*)  >  1	college_2
SELECT title FROM course GROUP BY title HAVING count(*)  >  1	college_2
SELECT sum(credits) ,  dept_name FROM course GROUP BY dept_name	college_2
SELECT sum(credits) ,  dept_name FROM course GROUP BY dept_name	college_2
SELECT min(salary) ,  dept_name FROM instructor GROUP BY dept_name HAVING avg(salary)  >  (SELECT avg(salary) FROM instructor)	college_2
SELECT min(salary) ,  dept_name FROM instructor GROUP BY dept_name HAVING avg(salary)  >  (SELECT avg(salary) FROM instructor)	college_2
SELECT count(*) ,  semester ,  YEAR FROM SECTION GROUP BY semester ,  YEAR	college_2
SELECT count(*) ,  semester ,  YEAR FROM SECTION GROUP BY semester ,  YEAR	college_2
SELECT YEAR FROM SECTION GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1	college_2
SELECT YEAR FROM SECTION GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1	college_2
SELECT semester ,  YEAR FROM SECTION GROUP BY semester ,  YEAR ORDER BY count(*) DESC LIMIT 1	college_2
SELECT semester ,  YEAR FROM SECTION GROUP BY semester ,  YEAR ORDER BY count(*) DESC LIMIT 1	college_2
SELECT dept_name FROM student GROUP BY dept_name ORDER BY count(*) DESC LIMIT 1	college_2
SELECT dept_name FROM student GROUP BY dept_name ORDER BY count(*) DESC LIMIT 1	college_2
SELECT count(*) ,  dept_name FROM student GROUP BY dept_name	college_2
SELECT count(*) ,  dept_name FROM student GROUP BY dept_name	college_2
SELECT semester ,  YEAR FROM takes GROUP BY semester ,  YEAR ORDER BY count(*) LIMIT 1	college_2
SELECT semester ,  YEAR FROM takes GROUP BY semester ,  YEAR ORDER BY count(*) LIMIT 1	college_2
SELECT i_id FROM advisor AS T1 JOIN student AS T2 ON T1.s_id  =  T2.id WHERE T2.dept_name  =  'History'	college_2
SELECT i_id FROM advisor AS T1 JOIN student AS T2 ON T1.s_id  =  T2.id WHERE T2.dept_name  =  'History'	college_2
SELECT T2.name ,  T2.salary FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'History'	college_2
SELECT T2.name ,  T2.salary FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'History'	college_2
SELECT course_id FROM course EXCEPT SELECT course_id FROM prereq	college_2
SELECT course_id FROM course EXCEPT SELECT course_id FROM prereq	college_2
SELECT title FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)	college_2
SELECT title FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)	college_2
SELECT title FROM course WHERE course_id IN (SELECT T1.prereq_id FROM prereq AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.title  =  'International Finance')	college_2
SELECT title FROM course WHERE course_id IN (SELECT T1.prereq_id FROM prereq AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.title  =  'International Finance')	college_2
SELECT title FROM course WHERE course_id IN (SELECT T1.course_id FROM prereq AS T1 JOIN course AS T2 ON T1.prereq_id  =  T2.course_id WHERE T2.title  =  'Differential Geometry')	college_2
SELECT title FROM course WHERE course_id IN (SELECT T1.course_id FROM prereq AS T1 JOIN course AS T2 ON T1.prereq_id  =  T2.course_id WHERE T2.title  =  'Differential Geometry')	college_2
SELECT name FROM student WHERE id IN (SELECT id FROM takes WHERE semester  =  'Fall' AND YEAR  =  2003)	college_2
SELECT name FROM student WHERE id IN (SELECT id FROM takes WHERE semester  =  'Fall' AND YEAR  =  2003)	college_2
SELECT T1.title FROM course AS T1 JOIN SECTION AS T2 ON T1.course_id  =  T2.course_id WHERE building  =  'Chandler' AND semester  =  'Fall' AND YEAR  =  2010	college_2
SELECT T1.title FROM course AS T1 JOIN SECTION AS T2 ON T1.course_id  =  T2.course_id WHERE building  =  'Chandler' AND semester  =  'Fall' AND YEAR  =  2010	college_2
SELECT T1.name FROM instructor AS T1 JOIN teaches AS T2 ON T1.id  =  T2.id JOIN course AS T3 ON T2.course_id  =  T3.course_id WHERE T3.title  =  'C Programming'	college_2
SELECT T1.name FROM instructor AS T1 JOIN teaches AS T2 ON T1.id  =  T2.id JOIN course AS T3 ON T2.course_id  =  T3.course_id WHERE T3.title  =  'C Programming'	college_2
SELECT T2.name ,  T2.salary FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'Math'	college_2
SELECT T2.name ,  T2.salary FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'Math'	college_2
SELECT T2.name FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'Math' ORDER BY T3.tot_cred	college_2
SELECT T2.name FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'Math' ORDER BY T3.tot_cred	college_2
SELECT title FROM course WHERE course_id IN (SELECT T1.prereq_id FROM prereq AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.title  =  'Mobile Computing')	college_2
SELECT title FROM course WHERE course_id IN (SELECT T1.prereq_id FROM prereq AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.title  =  'Mobile Computing')	college_2
SELECT T2.name FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id ORDER BY T3.tot_cred DESC LIMIT 1	college_2
SELECT T2.name FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id ORDER BY T3.tot_cred DESC LIMIT 1	college_2
SELECT name FROM instructor WHERE id NOT IN (SELECT id FROM teaches)	college_2
SELECT name FROM instructor WHERE id NOT IN (SELECT id FROM teaches)	college_2
SELECT id FROM instructor EXCEPT SELECT id FROM teaches	college_2
SELECT id FROM instructor EXCEPT SELECT id FROM teaches	college_2
SELECT name FROM instructor WHERE id NOT IN (SELECT id FROM teaches WHERE semester  =  'Spring')	college_2
SELECT name FROM instructor WHERE id NOT IN (SELECT id FROM teaches WHERE semester  =  'Spring')	college_2
SELECT dept_name FROM instructor GROUP BY dept_name ORDER BY avg(salary) DESC LIMIT 1	college_2
SELECT dept_name FROM instructor GROUP BY dept_name ORDER BY avg(salary) DESC LIMIT 1	college_2
SELECT avg(T1.salary) ,  count(*) FROM instructor AS T1 JOIN department AS T2 ON T1.dept_name  =  T2.dept_name ORDER BY T2.budget DESC LIMIT 1	college_2
SELECT avg(T1.salary) ,  count(*) FROM instructor AS T1 JOIN department AS T2 ON T1.dept_name  =  T2.dept_name ORDER BY T2.budget DESC LIMIT 1	college_2
SELECT T3.title ,  T3.credits FROM classroom AS T1 JOIN SECTION AS T2 ON T1.building  =  T2.building AND T1.room_number  =  T2.room_number JOIN course AS T3 ON T2.course_id  =  T3.course_id WHERE T1.capacity  =  (SELECT max(capacity) FROM classroom)	college_2
SELECT T3.title ,  T3.credits FROM classroom AS T1 JOIN SECTION AS T2 ON T1.building  =  T2.building AND T1.room_number  =  T2.room_number JOIN course AS T3 ON T2.course_id  =  T3.course_id WHERE T1.capacity  =  (SELECT max(capacity) FROM classroom)	college_2
SELECT name FROM student WHERE id NOT IN (SELECT T1.id FROM takes AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.dept_name  =  'Biology')	college_2
SELECT name FROM student WHERE id NOT IN (SELECT T1.id FROM takes AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.dept_name  =  'Biology')	college_2
SELECT count(DISTINCT T2.id) ,  count(DISTINCT T3.id) ,  T3.dept_name FROM department AS T1 JOIN student AS T2 ON T1.dept_name  =  T2.dept_name JOIN instructor AS T3 ON T1.dept_name  =  T3.dept_name GROUP BY T3.dept_name	college_2
SELECT count(DISTINCT T2.id) ,  count(DISTINCT T3.id) ,  T3.dept_name FROM department AS T1 JOIN student AS T2 ON T1.dept_name  =  T2.dept_name JOIN instructor AS T3 ON T1.dept_name  =  T3.dept_name GROUP BY T3.dept_name	college_2
SELECT T1.name FROM student AS T1 JOIN takes AS T2 ON T1.id  =  T2.id WHERE T2.course_id IN (SELECT T4.prereq_id FROM course AS T3 JOIN prereq AS T4 ON T3.course_id  =  T4.course_id WHERE T3.title  =  'International Finance')	college_2
SELECT T1.name FROM student AS T1 JOIN takes AS T2 ON T1.id  =  T2.id WHERE T2.course_id IN (SELECT T4.prereq_id FROM course AS T3 JOIN prereq AS T4 ON T3.course_id  =  T4.course_id WHERE T3.title  =  'International Finance')	college_2
SELECT name ,  salary FROM instructor WHERE salary  <  (SELECT avg(salary) FROM instructor WHERE dept_name  =  'Physics')	college_2
SELECT name ,  salary FROM instructor WHERE salary  <  (SELECT avg(salary) FROM instructor WHERE dept_name  =  'Physics')	college_2
SELECT T3.name FROM course AS T1 JOIN takes AS T2 ON T1.course_id  =  T2.course_id JOIN student AS T3 ON T2.id  =  T3.id WHERE T1.dept_name  =  'Statistics'	college_2
SELECT T3.name FROM course AS T1 JOIN takes AS T2 ON T1.course_id  =  T2.course_id JOIN student AS T3 ON T2.id  =  T3.id WHERE T1.dept_name  =  'Statistics'	college_2
SELECT T2.building ,  T2.room_number ,  T2.semester ,  T2.year FROM course AS T1 JOIN SECTION AS T2 ON T1.course_id  =  T2.course_id WHERE T1.dept_name  =  'Psychology' ORDER BY T1.title	college_2
SELECT T2.building ,  T2.room_number ,  T2.semester ,  T2.year FROM course AS T1 JOIN SECTION AS T2 ON T1.course_id  =  T2.course_id WHERE T1.dept_name  =  'Psychology' ORDER BY T1.title	college_2
SELECT name FROM instructor WHERE dept_name  =  'Comp. Sci.'	college_2
SELECT name FROM instructor WHERE dept_name  =  'Comp. Sci.'	college_2
SELECT name FROM instructor WHERE dept_name  =  'Comp. Sci.'  AND salary  >  80000	college_2
SELECT name FROM instructor WHERE dept_name  =  'Comp. Sci.'  AND salary  >  80000	college_2
SELECT name ,  course_id FROM instructor AS T1 JOIN teaches AS T2 ON T1.ID  =  T2.ID	college_2
SELECT name ,  course_id FROM instructor AS T1 JOIN teaches AS T2 ON T1.ID  =  T2.ID	college_2
SELECT name ,  course_id FROM instructor AS T1 JOIN teaches AS T2 ON T1.ID  =  T2.ID WHERE T1.dept_name  =  'Art'	college_2
SELECT name ,  course_id FROM instructor AS T1 JOIN teaches AS T2 ON T1.ID  =  T2.ID WHERE T1.dept_name  =  'Art'	college_2
SELECT name FROM instructor WHERE name LIKE '%dar%'	college_2
SELECT name FROM instructor WHERE name LIKE '%dar%'	college_2
SELECT DISTINCT name FROM  instructor ORDER BY name	college_2
SELECT DISTINCT name FROM  instructor ORDER BY name	college_2
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 UNION SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 UNION SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 INTERSECT SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 INTERSECT SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 EXCEPT SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 EXCEPT SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT DISTINCT salary FROM instructor WHERE salary  <  (SELECT max(salary) FROM instructor)	college_2
SELECT DISTINCT salary FROM instructor WHERE salary  <  (SELECT max(salary) FROM instructor)	college_2
SELECT COUNT (DISTINCT ID) FROM teaches WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT COUNT (DISTINCT ID) FROM teaches WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT dept_name ,  AVG (salary) FROM instructor GROUP BY dept_name HAVING AVG (salary)  >  42000	college_2
SELECT dept_name ,  AVG (salary) FROM instructor GROUP BY dept_name HAVING AVG (salary)  >  42000	college_2
SELECT name FROM instructor WHERE salary  >  (SELECT min(salary) FROM instructor WHERE dept_name  =  'Biology')	college_2
SELECT name FROM instructor WHERE salary  >  (SELECT min(salary) FROM instructor WHERE dept_name  =  'Biology')	college_2
SELECT name FROM instructor WHERE salary  >  (SELECT max(salary) FROM instructor WHERE dept_name  =  'Biology')	college_2
SELECT name FROM instructor WHERE salary  >  (SELECT max(salary) FROM instructor WHERE dept_name  =  'Biology')	college_2
SELECT T1.name ,  T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id  =  T2.country_id	soccer_1
SELECT count(*) FROM Country AS T1 JOIN League AS T2 ON T1.id  =  T2.country_id WHERE T1.name  =  "England"	soccer_1
SELECT avg(weight) FROM Player	soccer_1
SELECT max(weight) ,  min(weight) FROM Player	soccer_1
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating  >  ( SELECT avg(overall_rating) FROM Player_Attributes )	soccer_1
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.dribbling  =  ( SELECT max(overall_rating) FROM Player_Attributes)	soccer_1
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.crossing  >  90 AND T2.preferred_foot  =  "right"	soccer_1
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.preferred_foot  =  "left" AND T2.overall_rating  >=  85 AND T2.overall_rating  <=  90	soccer_1
SELECT preferred_foot ,  avg(overall_rating) FROM Player_Attributes GROUP BY preferred_foot	soccer_1
SELECT preferred_foot ,  count(*) FROM Player_Attributes WHERE overall_rating  >  80 GROUP BY preferred_foot	soccer_1
SELECT player_api_id FROM Player WHERE height  >=  180 INTERSECT SELECT player_api_id FROM Player_Attributes WHERE overall_rating  >  85	soccer_1
SELECT player_api_id FROM Player WHERE height  >=  180 AND height  <=  190 INTERSECT SELECT player_api_id FROM Player_Attributes WHERE preferred_foot  =  "left"	soccer_1
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id  =  T2.player_api_id ORDER BY overall_rating DESC LIMIT 3	soccer_1
SELECT DISTINCT T1.player_name ,  T1.birthday FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id  =  T2.player_api_id ORDER BY potential DESC LIMIT 5	soccer_1
SELECT count(*) FROM region	storm_record
SELECT count(*) FROM region	storm_record
SELECT region_code ,  region_name FROM region ORDER BY region_code	storm_record
SELECT region_code ,  region_name FROM region ORDER BY region_code	storm_record
SELECT region_name FROM region ORDER BY region_name	storm_record
SELECT region_name FROM region ORDER BY region_name	storm_record
SELECT region_name FROM region WHERE region_name != 'Denmark'	storm_record
SELECT region_name FROM region WHERE region_name != 'Denmark'	storm_record
SELECT count(*) FROM storm WHERE Number_Deaths  >  0	storm_record
SELECT count(*) FROM storm WHERE Number_Deaths  >  0	storm_record
SELECT name ,  dates_active ,  number_deaths FROM storm WHERE number_deaths  >=  1	storm_record
SELECT name ,  dates_active ,  number_deaths FROM storm WHERE number_deaths  >=  1	storm_record
SELECT avg(damage_millions_USD) ,  max(damage_millions_USD) FROM storm WHERE max_speed  >  1000	storm_record
SELECT avg(damage_millions_USD) ,  max(damage_millions_USD) FROM storm WHERE max_speed  >  1000	storm_record
SELECT sum(number_deaths) ,  sum(damage_millions_USD) FROM storm WHERE max_speed  >  (SELECT avg(max_speed) FROM storm)	storm_record
SELECT sum(number_deaths) ,  sum(damage_millions_USD) FROM storm WHERE max_speed  >  (SELECT avg(max_speed) FROM storm)	storm_record
SELECT name ,  damage_millions_USD FROM storm ORDER BY max_speed DESC	storm_record
SELECT name ,  damage_millions_USD FROM storm ORDER BY max_speed DESC	storm_record
SELECT count(DISTINCT region_id) FROM affected_region	storm_record
SELECT count(DISTINCT region_id) FROM affected_region	storm_record
SELECT region_name FROM region WHERE region_id NOT IN (SELECT region_id FROM affected_region)	storm_record
SELECT region_name FROM region WHERE region_id NOT IN (SELECT region_id FROM affected_region)	storm_record
SELECT T1.region_name ,  count(*) FROM region AS T1 JOIN affected_region AS T2 ON T1.region_id = T2.region_id GROUP BY T1.region_id	storm_record
SELECT T1.region_name ,  count(*) FROM region AS T1 JOIN affected_region AS T2 ON T1.region_id = T2.region_id GROUP BY T1.region_id	storm_record
SELECT T1.name ,  count(*) FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id	storm_record
SELECT T1.name ,  count(*) FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id	storm_record
SELECT T1.name ,  T1.max_speed FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id ORDER BY count(*) DESC LIMIT 1	storm_record
SELECT T1.name ,  T1.max_speed FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id ORDER BY count(*) DESC LIMIT 1	storm_record
SELECT name FROM storm WHERE storm_id NOT IN (SELECT storm_id FROM affected_region)	storm_record
SELECT name FROM storm WHERE storm_id NOT IN (SELECT storm_id FROM affected_region)	storm_record
SELECT T1.name FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id HAVING count(*)  >=  2 INTERSECT SELECT T1.name FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id HAVING sum(T2.number_city_affected)  >=  10	storm_record
SELECT T1.name FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id HAVING count(*)  >=  2 INTERSECT SELECT T1.name FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id HAVING sum(T2.number_city_affected)  >=  10	storm_record
SELECT name FROM storm EXCEPT SELECT T1.name FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id HAVING count(*)  >=  2	storm_record
SELECT name FROM storm EXCEPT SELECT T1.name FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id HAVING count(*)  >=  2	storm_record
SELECT T2.region_name FROM affected_region AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id JOIN storm AS T3 ON T1.storm_id  =  T3.storm_id WHERE T3.number_deaths  >=  10	storm_record
SELECT T2.region_name FROM affected_region AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id JOIN storm AS T3 ON T1.storm_id  =  T3.storm_id WHERE T3.number_deaths  >=  10	storm_record
SELECT T3.name FROM affected_region AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id JOIN storm AS T3 ON T1.storm_id  =  T3.storm_id WHERE T2.region_name  =  'Denmark'	storm_record
SELECT T3.name FROM affected_region AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id JOIN storm AS T3 ON T1.storm_id  =  T3.storm_id WHERE T2.region_name  =  'Denmark'	storm_record
SELECT T1.region_name FROM region AS T1 JOIN affected_region AS T2 ON T1.region_id = T2.region_id GROUP BY T1.region_id HAVING count(*)  >=  2	storm_record
SELECT T1.region_name FROM region AS T1 JOIN affected_region AS T2 ON T1.region_id = T2.region_id GROUP BY T1.region_id HAVING count(*)  >=  2	storm_record
SELECT T2.region_name FROM affected_region AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id JOIN storm AS T3 ON T1.storm_id  =  T3.storm_id ORDER BY T3.Number_Deaths DESC LIMIT 1	storm_record
SELECT T2.region_name FROM affected_region AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id JOIN storm AS T3 ON T1.storm_id  =  T3.storm_id ORDER BY T3.Number_Deaths DESC LIMIT 1	storm_record
SELECT T3.Name FROM affected_region AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id JOIN storm AS T3 ON T1.storm_id  =  T3.storm_id WHERE T2.Region_name  =  'Afghanistan' INTERSECT SELECT T3.Name FROM affected_region AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id JOIN storm AS T3 ON T1.storm_id  =  T3.storm_id WHERE T2.Region_name  =  'Albania'	storm_record
SELECT T3.Name FROM affected_region AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id JOIN storm AS T3 ON T1.storm_id  =  T3.storm_id WHERE T2.Region_name  =  'Afghanistan' INTERSECT SELECT T3.Name FROM affected_region AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id JOIN storm AS T3 ON T1.storm_id  =  T3.storm_id WHERE T2.Region_name  =  'Albania'	storm_record
SELECT title FROM Movie WHERE director = 'Steven Spielberg'	movie_1
SELECT title FROM Movie WHERE director = 'Steven Spielberg'	movie_1
SELECT title FROM Movie WHERE director = 'James Cameron' AND YEAR  >  2000	movie_1
SELECT title FROM Movie WHERE director = 'James Cameron' AND YEAR  >  2000	movie_1
SELECT count(*) FROM Movie WHERE YEAR  <  2000	movie_1
SELECT count(*) FROM Movie WHERE YEAR  <  2000	movie_1
SELECT director FROM Movie WHERE title  = 'Avatar'	movie_1
SELECT director FROM Movie WHERE title  = 'Avatar'	movie_1
SELECT count(*) FROM Reviewer	movie_1
SELECT count(*) FROM Reviewer	movie_1
SELECT rID FROM Reviewer WHERE name LIKE "%Mike%"	movie_1
SELECT rID FROM Reviewer WHERE name LIKE "%Mike%"	movie_1
SELECT rID FROM Reviewer WHERE name  =  "Daniel Lewis"	movie_1
SELECT rID FROM Reviewer WHERE name  =  "Daniel Lewis"	movie_1
SELECT count(*) FROM Rating WHERE stars  >  3	movie_1
SELECT count(*) FROM Rating WHERE stars  >  3	movie_1
SELECT max(stars) ,  min(stars) FROM Rating	movie_1
SELECT max(stars) ,  min(stars) FROM Rating	movie_1
SELECT DISTINCT YEAR FROM Movie AS T1 JOIN Rating AS T2 ON T1.mID  =  T2.mID WHERE T2.stars  >=  4 ORDER BY T1.year	movie_1
SELECT DISTINCT YEAR FROM Movie AS T1 JOIN Rating AS T2 ON T1.mID  =  T2.mID WHERE T2.stars  >=  4 ORDER BY T1.year	movie_1
SELECT T1.director ,  T1.title FROM Movie AS T1 JOIN Rating AS T2 ON T1.mID  =  T2.mID WHERE T2.stars  =  5	movie_1
SELECT T1.director ,  T1.title FROM Movie AS T1 JOIN Rating AS T2 ON T1.mID  =  T2.mID WHERE T2.stars  =  5	movie_1
SELECT T2.name ,  avg(T1.stars) FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID GROUP BY T2.name	movie_1
SELECT T2.name ,  avg(T1.stars) FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID GROUP BY T2.name	movie_1
SELECT title FROM Movie WHERE mID NOT IN (SELECT mID FROM Rating)	movie_1
SELECT title FROM Movie WHERE mID NOT IN (SELECT mID FROM Rating)	movie_1
SELECT DISTINCT name FROM Reviewer AS T1 JOIN Rating AS T2 ON T1.rID  =  T2.rID WHERE ratingDate  =  "null"	movie_1
SELECT DISTINCT name FROM Reviewer AS T1 JOIN Rating AS T2 ON T1.rID  =  T2.rID WHERE ratingDate  =  "null"	movie_1
SELECT avg(T1.stars) ,  T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T2.year  =  (SELECT min(YEAR) FROM Movie)	movie_1
SELECT avg(T1.stars) ,  T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T2.year  =  (SELECT min(YEAR) FROM Movie)	movie_1
SELECT title FROM Movie WHERE YEAR  =  (SELECT max(YEAR) FROM Movie)	movie_1
SELECT title FROM Movie WHERE YEAR  =  (SELECT max(YEAR) FROM Movie)	movie_1
SELECT max(T1.stars) ,  T2.year FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T2.year  =  (SELECT max(YEAR) FROM Movie)	movie_1
SELECT max(T1.stars) ,  T2.year FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T2.year  =  (SELECT max(YEAR) FROM Movie)	movie_1
SELECT title FROM Movie WHERE YEAR  >  (SELECT max(YEAR) FROM Movie WHERE director  =  "Steven Spielberg")	movie_1
SELECT title FROM Movie WHERE YEAR  >  (SELECT max(YEAR) FROM Movie WHERE director  =  "Steven Spielberg")	movie_1
SELECT T2.title ,  T2.director FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T1.stars  >  (SELECT avg(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T2.director  =  "James Cameron")	movie_1
SELECT T2.title ,  T2.director FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T1.stars  >  (SELECT avg(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T2.director  =  "James Cameron")	movie_1
SELECT T3.name ,  T2.title ,  T1.stars ,  T1.ratingDate FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID ORDER BY T3.name ,  T2.title ,  T1.stars	movie_1
SELECT T3.name ,  T2.title ,  T1.stars ,  T1.ratingDate FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID ORDER BY T3.name ,  T2.title ,  T1.stars	movie_1
SELECT T2.name FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID GROUP BY T1.rID HAVING COUNT(*)  >=  3	movie_1
SELECT T2.name FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID GROUP BY T1.rID HAVING COUNT(*)  >=  3	movie_1
SELECT DISTINCT T3.name FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T2.title  =  'Gone with the Wind'	movie_1
SELECT DISTINCT T3.name FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T2.title  =  'Gone with the Wind'	movie_1
SELECT DISTINCT T2.director FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T3.name  =  'Sarah Martinez'	movie_1
SELECT DISTINCT T2.director FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T3.name  =  'Sarah Martinez'	movie_1
SELECT DISTINCT T3.name ,  T2.title ,  T1.stars FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T2.director  =  T3.name	movie_1
SELECT DISTINCT T3.name ,  T2.title ,  T1.stars FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T2.director  =  T3.name	movie_1
SELECT name FROM Reviewer UNION SELECT title FROM Movie	movie_1
SELECT name FROM Reviewer UNION SELECT title FROM Movie	movie_1
SELECT DISTINCT title FROM Movie EXCEPT SELECT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T3.name  =  'Chris Jackson'	movie_1
SELECT DISTINCT title FROM Movie EXCEPT SELECT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T3.name  =  'Chris Jackson'	movie_1
SELECT T1.title ,  T1.director FROM Movie AS T1 JOIN Movie AS T2 ON T1.director  =  T2.director WHERE T1.title != T2.title ORDER BY T1.director ,  T1.title	movie_1
SELECT T1.title ,  T1.director FROM Movie AS T1 JOIN Movie AS T2 ON T1.director  =  T2.director WHERE T1.title != T2.title ORDER BY T1.director ,  T1.title	movie_1
SELECT T1.title ,  T1.year FROM Movie AS T1 JOIN Movie AS T2 ON T1.director  =  T2.director WHERE T1.title != T2.title	movie_1
SELECT T1.title ,  T1.year FROM Movie AS T1 JOIN Movie AS T2 ON T1.director  =  T2.director WHERE T1.title != T2.title	movie_1
SELECT director FROM Movie GROUP BY director HAVING count(*)  =  1	movie_1
SELECT director FROM Movie GROUP BY director HAVING count(*)  =  1	movie_1
SELECT director FROM Movie WHERE director != "null" GROUP BY director HAVING count(*)  =  1	movie_1
SELECT director FROM Movie WHERE director != "null" GROUP BY director HAVING count(*)  =  1	movie_1
SELECT count(*) ,  T1.director FROM Movie AS T1 JOIN Rating AS T2 ON T1.mID  =  T2.mID GROUP BY T1.director	movie_1
SELECT count(*) ,  T1.director FROM Movie AS T1 JOIN Rating AS T2 ON T1.mID  =  T2.mID GROUP BY T1.director	movie_1
SELECT T2.title ,  avg(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T1.mID ORDER BY avg(T1.stars) DESC LIMIT 1	movie_1
SELECT T2.title ,  avg(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T1.mID ORDER BY avg(T1.stars) DESC LIMIT 1	movie_1
SELECT T2.title ,  avg(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T1.mID ORDER BY avg(T1.stars) LIMIT 1	movie_1
SELECT T2.title ,  avg(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T1.mID ORDER BY avg(T1.stars) LIMIT 1	movie_1
SELECT T2.title ,  T2.year FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID ORDER BY T1.stars DESC LIMIT 3	movie_1
SELECT T2.title ,  T2.year FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID ORDER BY T1.stars DESC LIMIT 3	movie_1
SELECT T2.title ,  T1.stars ,  T2.director ,  max(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE director != "null" GROUP BY director	movie_1
SELECT T2.title ,  T1.stars ,  T2.director ,  max(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE director != "null" GROUP BY director	movie_1
SELECT T2.title ,  T1.rID ,  T1.stars ,  min(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T1.rID	movie_1
SELECT T2.title ,  T1.rID ,  T1.stars ,  min(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T1.rID	movie_1
SELECT T2.title ,  T1.stars ,  T2.director ,  min(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T2.director	movie_1
SELECT T2.title ,  T1.stars ,  T2.director ,  min(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T2.director	movie_1
SELECT T2.title ,  T1.mID FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T1.mID ORDER BY count(*) DESC LIMIT 1	movie_1
SELECT T2.title ,  T1.mID FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T1.mID ORDER BY count(*) DESC LIMIT 1	movie_1
SELECT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T1.stars BETWEEN 3 AND 5	movie_1
SELECT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T1.stars BETWEEN 3 AND 5	movie_1
SELECT T2.name FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T1.stars  >  3	movie_1
SELECT T2.name FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T1.stars  >  3	movie_1
SELECT mID ,  avg(stars) FROM Rating WHERE mID NOT IN (SELECT T1.mID FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T2.name  =  "Brittany Harris") GROUP BY mID	movie_1
SELECT mID ,  avg(stars) FROM Rating WHERE mID NOT IN (SELECT T1.mID FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T2.name  =  "Brittany Harris") GROUP BY mID	movie_1
SELECT mID FROM Rating EXCEPT SELECT T1.mID FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T2.name  =  "Brittany Harris"	movie_1
SELECT mID FROM Rating EXCEPT SELECT T1.mID FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T2.name  =  "Brittany Harris"	movie_1
SELECT mID ,  avg(stars) FROM Rating GROUP BY mID HAVING count(*)  >=  2	movie_1
SELECT mID ,  avg(stars) FROM Rating GROUP BY mID HAVING count(*)  >=  2	movie_1
SELECT rID FROM Rating EXCEPT SELECT rID FROM Rating WHERE stars  =  4	movie_1
SELECT rID FROM Rating EXCEPT SELECT rID FROM Rating WHERE stars  =  4	movie_1
SELECT rID FROM Rating WHERE stars != 4	movie_1
SELECT rID FROM Rating WHERE stars != 4	movie_1
SELECT DISTINCT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T3.name  =  'Brittany Harris' OR T2.year  >  2000	movie_1
SELECT DISTINCT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T3.name  =  'Brittany Harris' OR T2.year  >  2000	movie_1
SELECT title FROM Movie WHERE director  =  "James Cameron" OR YEAR   <  1980	movie_1
SELECT title FROM Movie WHERE director  =  "James Cameron" OR YEAR   <  1980	movie_1
SELECT T2.name FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T1.stars  =  3 INTERSECT SELECT T2.name FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T1.stars  =  4	movie_1
SELECT T2.name FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T1.stars  =  3 INTERSECT SELECT T2.name FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T1.stars  =  4	movie_1
SELECT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T1.stars  =  3 INTERSECT SELECT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T1.stars  =  4	movie_1
SELECT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T1.stars  =  3 INTERSECT SELECT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T1.stars  =  4	movie_1
SELECT count(*) FROM ASSESSMENT_NOTES	behavior_monitoring
SELECT date_of_notes FROM Assessment_Notes	behavior_monitoring
SELECT count(*) FROM ADDRESSES WHERE zip_postcode  =  "197"	behavior_monitoring
SELECT count(DISTINCT incident_type_code) FROM Behavior_Incident	behavior_monitoring
SELECT DISTINCT detention_type_code FROM Detention	behavior_monitoring
SELECT date_incident_start ,  date_incident_end FROM Behavior_Incident WHERE incident_type_code  =  "NOISE"	behavior_monitoring
SELECT detention_summary FROM Detention	behavior_monitoring
SELECT cell_mobile_number ,  email_address FROM STUDENTS	behavior_monitoring
SELECT email_address FROM Students WHERE first_name  =  "Emma" AND last_name  =  "Rohan"	behavior_monitoring
SELECT count(DISTINCT student_id) FROM Students_in_Detention	behavior_monitoring
SELECT gender FROM TEACHERS WHERE last_name  =  "Medhurst"	behavior_monitoring
SELECT incident_type_description FROM Ref_Incident_Type WHERE incident_type_code  =  "VIOLENCE"	behavior_monitoring
SELECT max(monthly_rental) ,  min(monthly_rental) FROM Student_Addresses	behavior_monitoring
SELECT first_name FROM Teachers WHERE email_address LIKE '%man%'	behavior_monitoring
SELECT * FROM Assessment_Notes ORDER BY date_of_notes ASC	behavior_monitoring
SELECT city FROM Addresses ORDER BY city	behavior_monitoring
SELECT first_name ,  last_name FROM Teachers ORDER BY last_name	behavior_monitoring
SELECT * FROM Student_Addresses ORDER BY monthly_rental DESC	behavior_monitoring
SELECT T1.student_id ,  T2.first_name FROM Assessment_Notes AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1	behavior_monitoring
SELECT T1.teacher_id ,  T2.first_name FROM Assessment_Notes AS T1 JOIN Teachers AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 3	behavior_monitoring
SELECT T1.student_id ,  T2.last_name FROM Behavior_Incident AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1	behavior_monitoring
SELECT T1.teacher_id ,  T2.last_name FROM Detention AS T1 JOIN Teachers AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T1.detention_type_code  =  "AFTER" GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 1	behavior_monitoring
SELECT T1.student_id ,  T2.first_name FROM Student_Addresses AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY AVG(monthly_rental) DESC LIMIT 1	behavior_monitoring
SELECT T2.address_id ,  T1.city FROM Addresses AS T1 JOIN Student_Addresses AS T2 ON T1.address_id  =  T2.address_id GROUP BY T2.address_id ORDER BY AVG(monthly_rental) DESC LIMIT 1	behavior_monitoring
SELECT T1.incident_type_code ,  T2.incident_type_description FROM Behavior_Incident AS T1 JOIN Ref_Incident_Type AS T2 ON T1.incident_type_code  =  T2.incident_type_code GROUP BY T1.incident_type_code ORDER BY count(*) DESC LIMIT 1	behavior_monitoring
SELECT T1.detention_type_code ,  T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY count(*) ASC LIMIT 1	behavior_monitoring
SELECT T1.date_of_notes FROM Assessment_Notes AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T2.first_name  =  "Fanny"	behavior_monitoring
SELECT T1.text_of_notes FROM Assessment_Notes AS T1 JOIN Teachers AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.last_name  =  "Schuster"	behavior_monitoring
SELECT T1.date_incident_start ,  date_incident_end FROM Behavior_Incident AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T2.last_name  =  "Fahey"	behavior_monitoring
SELECT T1.datetime_detention_start ,  datetime_detention_end FROM Detention AS T1 JOIN Teachers AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.last_name  =  "Schultz"	behavior_monitoring
SELECT T2.address_id ,  T1.zip_postcode FROM Addresses AS T1 JOIN Student_Addresses AS T2 ON T1.address_id  =  T2.address_id ORDER BY monthly_rental DESC LIMIT 1	behavior_monitoring
SELECT T2.cell_mobile_number FROM Student_Addresses AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id ORDER BY T1.monthly_rental ASC LIMIT 1	behavior_monitoring
SELECT T2.monthly_rental FROM Addresses AS T1 JOIN Student_Addresses AS T2 ON T1.address_id  =  T2.address_id WHERE T1.state_province_county  =  "Texas"	behavior_monitoring
SELECT T2.first_name ,  T2.last_name FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id  =  T2.address_id WHERE T1.state_province_county  =  "Wisconsin"	behavior_monitoring
SELECT T1.line_1 ,  avg(T2.monthly_rental) FROM Addresses AS T1 JOIN Student_Addresses AS T2 ON T1.address_id  =  T2.address_id GROUP BY T2.address_id	behavior_monitoring
SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Teachers AS T2 ON T1.address_id  =  T2.address_id WHERE T2.first_name  =  "Lyla"	behavior_monitoring
SELECT T2.email_address FROM Addresses AS T1 JOIN Teachers AS T2 ON T1.address_id  =  T2.address_id WHERE T1.zip_postcode  =  "918"	behavior_monitoring
SELECT count(*) FROM STUDENTS WHERE student_id NOT IN ( SELECT student_id FROM Behavior_Incident )	behavior_monitoring
SELECT last_name FROM Teachers EXCEPT SELECT T1.last_name FROM Teachers AS T1 JOIN Detention AS T2 ON T1.teacher_id  =  T2.teacher_id	behavior_monitoring
SELECT T1.line_1 FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id  =  T2.address_id INTERSECT SELECT T1.line_1 FROM Addresses AS T1 JOIN Teachers AS T2 ON T1.address_id  =  T2.address_id	behavior_monitoring
SELECT count(*) FROM book_club	culture_company
SELECT count(*) FROM book_club	culture_company
SELECT book_title ,  author_or_editor FROM book_club WHERE YEAR  >  1989	culture_company
SELECT book_title ,  author_or_editor FROM book_club WHERE YEAR  >  1989	culture_company
SELECT DISTINCT publisher FROM book_club	culture_company
SELECT DISTINCT publisher FROM book_club	culture_company
SELECT YEAR ,  book_title ,  publisher FROM book_club ORDER BY YEAR DESC	culture_company
SELECT YEAR ,  book_title ,  publisher FROM book_club ORDER BY YEAR DESC	culture_company
SELECT publisher ,  count(*) FROM book_club GROUP BY publisher	culture_company
SELECT publisher ,  count(*) FROM book_club GROUP BY publisher	culture_company
SELECT publisher FROM book_club GROUP BY publisher ORDER BY count(*) DESC LIMIT 1	culture_company
SELECT publisher FROM book_club GROUP BY publisher ORDER BY count(*) DESC LIMIT 1	culture_company
SELECT category ,  count(*) FROM book_club GROUP BY category	culture_company
SELECT category ,  count(*) FROM book_club GROUP BY category	culture_company
SELECT category FROM book_club WHERE YEAR  >  1989 GROUP BY category HAVING count(*)  >=  2	culture_company
SELECT category FROM book_club WHERE YEAR  >  1989 GROUP BY category HAVING count(*)  >=  2	culture_company
SELECT publisher FROM book_club WHERE YEAR  =  1989 INTERSECT SELECT publisher FROM book_club WHERE YEAR  =  1990	culture_company
SELECT publisher FROM book_club WHERE YEAR  =  1989 INTERSECT SELECT publisher FROM book_club WHERE YEAR  =  1990	culture_company
SELECT publisher FROM book_club EXCEPT SELECT publisher FROM book_club WHERE YEAR  =  1989	culture_company
SELECT publisher FROM book_club EXCEPT SELECT publisher FROM book_club WHERE YEAR  =  1989	culture_company
SELECT title ,  YEAR ,  director FROM movie ORDER BY budget_million	culture_company
SELECT title ,  YEAR ,  director FROM movie ORDER BY budget_million	culture_company
SELECT COUNT (DISTINCT director) FROM movie	culture_company
SELECT COUNT (DISTINCT director) FROM movie	culture_company
SELECT title ,  director FROM movie WHERE YEAR  <=  2000 ORDER BY gross_worldwide DESC LIMIT 1	culture_company
SELECT title ,  director FROM movie WHERE YEAR  <=  2000 ORDER BY gross_worldwide DESC LIMIT 1	culture_company
SELECT director FROM movie WHERE YEAR  =  2000 INTERSECT SELECT director FROM movie WHERE YEAR  =  1999	culture_company
SELECT director FROM movie WHERE YEAR  =  2000 INTERSECT SELECT director FROM movie WHERE YEAR  =  1999	culture_company
SELECT director FROM movie WHERE YEAR  =  1999 OR YEAR  =  2000	culture_company
SELECT director FROM movie WHERE YEAR  =  1999 OR YEAR  =  2000	culture_company
SELECT avg(budget_million) ,  max(budget_million) ,  min(budget_million) FROM movie WHERE YEAR  <  2000	culture_company
SELECT avg(budget_million) ,  max(budget_million) ,  min(budget_million) FROM movie WHERE YEAR  <  2000	culture_company
SELECT T1.company_name FROM culture_company AS T1 JOIN book_club AS T2 ON T1.book_club_id  =  T2.book_club_id WHERE T2.publisher  =  'Alyson'	culture_company
SELECT T1.company_name FROM culture_company AS T1 JOIN book_club AS T2 ON T1.book_club_id  =  T2.book_club_id WHERE T2.publisher  =  'Alyson'	culture_company
SELECT T1.title ,  T3.book_title FROM movie AS T1 JOIN culture_company AS T2 ON T1.movie_id  =  T2.movie_id JOIN book_club AS T3 ON T3.book_club_id  =  T2.book_club_id WHERE T2.incorporated_in  =  'China'	culture_company
SELECT T1.title ,  T3.book_title FROM movie AS T1 JOIN culture_company AS T2 ON T1.movie_id  =  T2.movie_id JOIN book_club AS T3 ON T3.book_club_id  =  T2.book_club_id WHERE T2.incorporated_in  =  'China'	culture_company
SELECT T2.company_name FROM movie AS T1 JOIN culture_company AS T2 ON T1.movie_id  =  T2.movie_id WHERE T1.year  =  1999	culture_company
SELECT T2.company_name FROM movie AS T1 JOIN culture_company AS T2 ON T1.movie_id  =  T2.movie_id WHERE T1.year  =  1999	culture_company
SELECT count(*) FROM player	riding_club
SELECT Player_name FROM player ORDER BY Votes ASC	riding_club
SELECT Gender ,  Occupation FROM player	riding_club
SELECT Player_name ,  residence FROM player WHERE Occupation != "Researcher"	riding_club
SELECT Sponsor_name FROM player WHERE Residence  =  "Brandon" OR Residence  =  "Birtle"	riding_club
SELECT Player_name FROM player ORDER BY Votes DESC LIMIT 1	riding_club
SELECT Occupation ,  COUNT(*) FROM player GROUP BY Occupation	riding_club
SELECT Occupation FROM player GROUP BY Occupation ORDER BY COUNT(*) DESC LIMIT 1	riding_club
SELECT Residence FROM player GROUP BY Residence HAVING COUNT(*)  >=  2	riding_club
SELECT T3.Player_name ,  T2.coach_name FROM player_coach AS T1 JOIN coach AS T2 ON T1.Coach_ID  =  T2.Coach_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID	riding_club
SELECT T3.Player_name FROM player_coach AS T1 JOIN coach AS T2 ON T1.Coach_ID  =  T2.Coach_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID WHERE T2.Rank  =  1	riding_club
SELECT T3.Player_name ,  T3.gender FROM player_coach AS T1 JOIN coach AS T2 ON T1.Coach_ID  =  T2.Coach_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID WHERE T1.Starting_year  >  2011	riding_club
SELECT T3.Player_name ,  T2.coach_name FROM player_coach AS T1 JOIN coach AS T2 ON T1.Coach_ID  =  T2.Coach_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID ORDER BY T3.Votes DESC	riding_club
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM player_coach)	riding_club
SELECT Residence FROM player WHERE gender  =  "M" INTERSECT SELECT Residence FROM player WHERE gender  =  "F"	riding_club
SELECT T1.club_id ,  T1.club_name, count(*) FROM club AS T1 JOIN coach AS T2 ON T1.club_id  =  T2.club_id GROUP BY T1.club_id	riding_club
SELECT T1.club_id ,  T1.gold FROM match_result AS T1 JOIN coach AS T2 ON T1.club_id  =  T2.club_id GROUP BY T1.club_id ORDER BY count(*) DESC LIMIT 1	riding_club