SELECT 'hello world' AS method;


SELECT 'good day!'; 


SELECT 'okay';

SELECT *
FROM HumanResources.Employee;


SELECT top 20 *
FROM HumanResources.Department;

SELECT top 5 DepartmentID, Name
FROM HumanResources.Department;

SELECT top 5 DepartmentID AS ID, Name AS 'Department Name'
FROM HumanResources.Department;


SELECT top 10 DepartmentID AS ID, Name AS 'Department Name'
FROM HumanResources.Department
ORDER BY ID DESC;


SELECT top 10 DepartmentID AS ID, Name AS 'Department Name'
FROM HumanResources.Department
ORDER BY ID;


SELECT DepartmentID AS ID, Name AS 'Department Name'
FROM HumanResources.Department AS hr_department
ORDER BY ID
offset 3 rows
fetch next 3 rows only;


-- guid (global unique identifier)
select newid() 


--- String Functions ---
/*
ASCII - very rarely
char - sometimes
charindex - sometimes
concat/concat with + - almost everyday
concat with sepeartor - very often
format - sometimes
substring - very often 
left, right, len, lower, upper, trim, ltrim, rtrim - almost everyday
replace, replicate, reverse - sometimes
*/

/*
datefromparts, timefromparts, datepart, day, month, year, 
getdate, current_timestamp, datediff, dateadd, eomonth, format
diff between date and utc date?


*/


