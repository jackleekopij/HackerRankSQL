SELECT 
    CASE WHEN g.Grade < 8 THEN NULL ELSE s.Name END ASName, /*** Create an if statement for setting the name of
    students with grades less than 8 to NULL else return the students actual name ***/
    g.Grade, s.Marks
    /*** Inner join to get the student 'grade' where 'grade' is defined as a bound in Grades table. Join
    this to the table students to allocate a students score/100 to a 'grade'
    FROM STUDENTS s
    INNER JOIN Grades g
    ON s.Marks BETWEEN g.Min_Mark and g.Max_Mark 
    /*** Order the results correctly. First by their 'grade' descending, then alphatbetically and finally via marks ***/
    ORDER BY g.Grade desc, Name, s.Marks       -- Note: you can order one column by desc and another by asc 
