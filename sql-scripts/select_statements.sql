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
-- '   anish     ' => '   anish'

-- declare and set a variable
declare @input varchar(50);
declare @output varchar(50);

set @input = '   anish    rashmi                         ';


-- 'anish   rashmi'
--select @output = rtrim(lTRIM(@input))
--select @output as 'output'

-- input contains 'ish' -> YES or NO
if CHARINDEX('ishu', @input) = 0
	select 'false';
else
	select 'true';

select 'anish',
case 
	when charindex('ish', @input) <> 0 then 'contains ish' 
	when charindex('ash', @input) <> 0 then 'contains ash'
	else 'didnt match'	
end,
SUBSTRING(@input, 4, 5),
'another column'


select 'don''t'

-- anish''''karki - character escaping
select 'anish''''''''karki'


declare @input2 varchar(100);
set @input2 = 'datefromparts, timefromparts, datepart, day, month, year,';
declare @start_position int;
set @start_position = CHARINDEX('time', @input2)

declare @length int;
set @length = LEN(@input2)

select SUBSTRING(@input2, @start_position, @length - @start_position)

-- ras

/*
difference between varchar and nvarchar

datefromparts, timefromparts, datepart, day, month, year, 
getdate, current_timestamp, datediff, dateadd, eomonth, format
diff between date and utc date?


primary key
foreign key
unique key
composite key

constraints

*/


--- joins 
-- inner join
-- left join
-- right join, self join

select top 10 * 
from Sales.SalesOrderDetail as sod
inner join Sales.SalesOrderHeader as soh on sod.SalesOrderID = soh.SalesOrderID
where soh.CreditCardApprovalCode = '10'
and CHARINDEX(sod.CarrierTrackingNumber, 'abc') <> 0



select * from Sales.SalesOrderHeader where SalesOrderID = '43659'


