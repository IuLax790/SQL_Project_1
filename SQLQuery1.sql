
--1.string concatenation- applies only on strings--
--שרשור של מספר עמודות לתוך עמודה אחת --

-- 2.using distinct on multiple columns
--SELECT  distinct city,ContactName,Region 
--from Customers

-- 3.Where clause example.
--syntax:
--column name
--operator(<,>,=,<=,>=,!=)
--value: numeric value,string,data value

--4.SELECT  quantity,ProductID
--from [Order Details]
--Where  Discount>0.20

--5.in operator
--syntax
-- * operator with Numeric values
-- * operator with Character values
-- * operator with	Date  values
-- * Not operator
SELECT ProductID,UnitPrice
from [Order Details]
where Discount in ('0.05') 
--between operator:
--syntax:
-- WHERE column_name BETWEEN lower_bound AND upper_bound. upper_bound must b
SELECT FirstName,LastName,Address,city,HomePhone,title
from Employees
where Title   between 'O' and 'Z'

--6.like operator
--a.wildcards operators
-- * % - the percent (%) sign represents any sequence of characters.
-- * _ - the percent (_) sign represents any single character.
--b.Examples:
SELECT FirstName,LastName,Address,city,HomePhone,title
from Employees
where LastName like '%A%'

SELECT FirstName,LastName,Address,city,HomePhone,title
from Employees
where HomePhone like '71%'

	SELECT ContactName,Address,city
	from Customers
	where City like 'Dallas'

-- '%letter_' contains any expression with this character.
SELECT ContactName,Phone,Address,city,Country
from customers
where Address  not like '____r%' and Address not like '%24_' and Address not like '%s' and Address not like '__rr%' and 
ContactName not like '%e%'
--c.not operator

SELECT ContactName,Phone,Address,city,Country
from customers
where Address  not like '____r%' and Address not like '%24_' and Address not like '%s' and Address not like '__rr%' and 
ContactName not like '%e%'

--7.IS NULL query

--intro
-- SELECT column_name from table WHERE column_name =NULL or WHERE column_name is not NULL 
--example
SELECT region,Fax from 
customers where region = NULL

SELECT region,Fax from 
customers where Region <>NULL


--Not operator
SELECT region,Fax from 
customers where Region is not NULL

SELECT region,Fax from 
customers where Region is not NULL and  fax is not null

--8. AND & OR operator
--a.and operator:
SELECT contactNAME,city,CustomerID from Customers
WHERE city = 'Seattle' AND Country = 'USA'

--b.or operator:
SELECT contactNAME,city,CustomerID,ContactTitle from Customers
WHERE city = 'London' or ContactName = 'Karl Jablonski'
--c.order of precedence:
SELECT contactNAME,customerID,city from Customers
--d.changing the order of precedence:
SELECT contactNAME,customerID,city from Customers
WHERE (city = 'Seattle' or city='Berlin') and ContactTitle = 'owner'
--in that way , we made city boolean one unit
--The 'Where' Command appears only once in query

--9. Order by command:
	--sort the results in an ascending/descending order:
		--ascending order:
		SELECT OrderID,ProductID,unitprice,Discount from [Order Details]
		WHERE UnitPrice between 50 and 100 and (Discount = '0.15' or Discount= '0.2') 
		order by UnitPrice
		--descending order:
		SELECT OrderID,ProductID,unitprice,Discount from [Order Details]
		WHERE UnitPrice between 50 and 100 and (Discount = '0.15' or Discount= '0.2')
		order by UnitPrice desc

		--sort by multiple columns:
		SELECT OrderID,ProductID,unitprice,Discount from [Order Details]
		WHERE UnitPrice between 50 and 100 and (Discount = '0.15' or Discount= '0.2')
		order by UnitPrice,Discount desc


		--nulls:
		--show null values in the end:
		SELECT contactname,phone,city,Region from Customers,Region
		order by Region desc
--10. Top Statement
----------------------
-- Limiting the number of rows
	SELECT TOP 10 FirstName,LastName,city from Employees
	--or 
	SELECT * from Employees

--Top N- Analysis
	SELECT TOP 5 FirstName,LastName,city,HireDate from Employees
	order by HireDate 
	SELECT TOP 5 FirstName,LastName,city,HireDate from Employees
	order by HireDate desc

--11.Scalar Functions.
-- * into
SELECT lastname,upper(lastname) as 'Last Name'  from Employees
-- Examples
-- function general structures
-- function Name()
--	type of functions
--		*String
--		*Numeric
--		*Date
--		*Conversions

-- Scalar Functions and DB Platforms
--queries without FROM clause
	SELECT 1+1

	SELECT UPPER('Hello')

--16.String Functions
	--a.Right
	SELECT right('Hello',3)
	--b.Left
	SELECT left('Hello',3)

	--c.Len
	SELECT len('Hello')

	--d.Replace
	SELECT replace('Hello','o','*')

	--e.Reverse
	SELECT reverse('Hello world')

	--f.Substring
	SELECT substring('My World',3,5)

	--g.Lower
  	SELECT lower('Hello')

	--h.Upper
  	SELECT upper('Hello')
	
	--i.Customer's Demo
	--j.Right,Left,Len,Replace,Reverse,Lower,Upper
	SELECT lastName,upper(LastName) from Employees
	SELECT lastName,lower(LastName) from Employees
	SELECT lastName,upper(right(FirstName,3)) + lower(left(LastName,5)) + '@gmail.com' as 'New address',len(firstname) as 'Length'
	,HomePhone,replace(HomePhone,'-','--') as 'New PhoneNumber' from Employees
	SELECT lastName,lower(left(LastName,5)) from Employees
	SELECT lastName,reverse(LastName) as 'Reversed Name' from Employees
	SELECT lastName,replace(LastName,'i','I') from Employees
	SELECT lastName,len(FirstName) as 'Length' from Employees
	SELECT lastName,substring(FirstName,3,7) AS 'New FirstName' from Employees



--18.Numeric Functions
	--a.Floor
	SELECT floor(34.9)
	--b.Ceiling
	SELECT CEILING(34.1)
	--c.Round
	SELECT round(35.666,0)
	SELECT round(35.675,2)
	--d.order detail's demo
	SELECT ProductID,UnitPrice*1.22 ,floor(unitPrice*1.22) as 'Floor_Price' from [Order Details]

--19.Date Functions
	--a.GetDate()
	SELECT GETDATE()
	--b.DateAdd
	SELECT GETDATE(),DATEADD(day,22,GETDATE()) As 'New Date'
	SELECT GETDATE(),DATEADD(YEAR,5,GETDATE()) As 'New Date'
	SELECT GETDATE(),DATEADD(MONTH,3,GETDATE()) As 'New Date'
	--c.DateDiff
	SELECT DATEDIFF(MONTH,'2010-06-01',GETDATE())
	SELECT DATEDIFF(day,'2015-06-01',GETDATE()) as 'Date Gap'
	SELECT DATEDIFF(year,'2010-06-01',GETDATE()) as 'Year Gap'

	--d.Day
	SELECT day('2012-03-06')
	--e.Month
	SELECT month('2012-11-06')

	--f.Year
	SELECT year('1845-03-06')
	SELECT Year(GETDATE())


	--g.Customer's Demo
	SELECT Lastname,BirthDate,DATEADD(Year,5,BirthDate) as 'BirthDate+ 5 Years' from Employees
	SELECT Lastname,BirthDate,datediff(MONTH,BirthDate,GETDATE()) as 'Date Gap from BirthDate' from Employees
	SELECT Lastname,BirthDate,day(BirthDate) as 'Day of BirthDate' from Employees
	SELECT Lastname,BirthDate,month(BirthDate) as 'Month of BirthDate' ,
	day(BirthDate) as 'Day of BirthDate' , Year(BirthDate) as 'Year of BirthDate' from Employees
	WHERE year(BirthDate)>1955
	SELECT Lastname,BirthDate,year(BirthDate) as 'Year of BirthDate' from Employees

--20. Conversion Functions:
	--a.Intro
	SELECT 'The current Date is:'+GETDATE()
	SELECT 'The number is:' + 10
	--b.Cast -works on all platform
	SELECT 'The current Date is:'+cast(GETDATE() as varchar) as 'My String'
	SELECT 'The number is:' + cast(10 as varchar)  as 'My String'


	--c.Convert - works only in microsoft
	SELECT 'The current date is: ' + CONVERT(varchar,'2011-3-22',111) as 'My Date'
	SELECT 'The Number is: ' + CONVERT(varchar,10.54) as 'My Number'
	--d.employees Demo
		SELECT FirstName + ' '+ cast(HireDate as varchar) as " Employee' Details" from Employees
		where Year(HireDate)<1993
	SELECT LastName + ' '+ convert(varchar,HireDate) as " Employee' Details" from Employees
	WHERE day(hiredate)<10

--20. Is null
	--customer's Demo
	SELECT ContactName,Phone,ISNULL(region,0),ISNULL(cast(region as varchar),'No region') from customers

--21.Conditional Functions
-- Case

SELECT ProductID,UnitPrice,Discount ,
CASE when discount between 0 and 0.2 then 'Grade A'  
	 when Discount between 0.21 and 0.4 then 'Grade B' 
	 else 'Grade C' 
END AS 'Grades' from [Order Details]

--22. Group Functions
	--a.Group functions vs Scalar functions
	SELECT upper(lastname) from Employees

	SELECT avg(unitprice) from [Order Details]
	--b.Common Group functions:
--	* Min
SELECT min(discount) from [Order Details]

SELECT min(hiredate) from Employees

SELECT min(lastname) from Employees


--	* Max
SELECT max(discount) from [Order Details]
SELECT max(lastname) from Employees

--	* AVG
SELECT avg(discount) from [Order Details]
SELECT avg(UnitPrice) from [Order Details]

--	* SUM
SELECT sum(unitprice) from [Order Details]
--	* COUNT(*) - returns the number of lines in a table,including NULL
SELECT COUNT(*) from Customers

--	* COUNT(COLUMN)
SELECT COUNT(Region) from Customers

--	* COUNT(DISTINCT COLUMN)-counts the number of distinct appearances within a row.
SELECT lastname, HomePhone ,TitleOfCourtesy from Employees
SELECT COUNT(distinct titleofCourtesy) from Employees
	--c.Group functions and NULL
	--* ALL Group functions ignore NULL values.
	--* in SQL Server you can use the ISNULL function to force group functions to include NULL
SELECT avg(productid) from [Order Details]
SELECT avg(isnull(productid,0)) from [Order Details]
--
--23. Group by Clause
	SELECT *from customers
	--Using the Group by Clause
	SELECT avg(unitprice) from [Order Details]

	SELECT Discount,avg(unitprice) as 'Price by Discount rate' from [Order Details]
	 GROUP by Discount
	 
	SELECT City,count(*) as 'Count by City' from Employees Group by City 
	-- Guidelines:
	-- * All columns in the SQL Server SELECT clause that are not group functions
	--	 must be in the GROUP BY clause.
	SELECT Country,count(*) as 'Count by Country' from customers
	-- * the GROUP by columns don't have to be in the SQL server SELECT clause
	SELECT count(*) from customers group by Country
	-- * You can list more than one column after the SQL server GROUP BY Clause
	SELECT country,city ,COUNT(*) 'Count by Country and City' from customers group by country,city order by country

--24.Having Clause

-- * Restricting Groups
-- * Using the SQL Server WHERE Clause,you can exclude rows before dividing them into groups.
-- * You cannot use the SQL Server WHERE clause to restrict groups.
-- * The Having Clause


--SELECT
--FROM
--WHERE

--25.Join
--a.Intro
--b.Basic Join Syntax
SELECT * from Customers
SELECT ordt.orderid,ordt.UnitPrice,ordt.Quantity,ordt.Discount from [Order Details] ordt JOIN Orders ord ON
ordt.OrderID = ord.OrderID order by Quantity desc
--c.Using Table alias
--26. Join more than 2 tables
SELECT ordt.orderid,ordt.UnitPrice,ordt.Quantity,ordt.Discount from [Order Details] ordt JOIN Orders ord ON
ordt.OrderID = ord.OrderID order by Quantity desc

SELECT * from products
SELECT * from [Order Details]
--SYNTAX
------------------------------------------------------------------------------------------------
SELECT ordt.orderid,ordt.unitprice,ordt.Quantity,ord.ShipCity, prd.ProductName,prd.CategoryID
from [Order Details] ordt JOIN Products prd
ON ordt.ProductID = prd.ProductID
					JOIN orders ord
ON ord.OrderID = ordt.OrderID
WHERE prd.ProductID = 1
order by prd.ProductName
------------------------------------------------------------------------------------------------
--27.INNER,LEFT,RIGHT,and FULL OUTER JOIN
--1.Inner Join
--2.Left Outer Join
SELECT ordt.orderid,ordt.unitprice,ordt.Quantity, prd.ProductName,prd.CategoryID
from [Order Details] ordt LEFT outer JOIN Products prd
ON ordt.ProductID = prd.ProductID
--3.Right Outer Join
SELECT ordt.orderid,ordt.unitprice,ordt.Quantity, prd.ProductName,prd.CategoryID
from [Order Details] ordt Right outer JOIN Products prd
ON ordt.ProductID = prd.ProductID
--4.Full Outer Join
SELECT ordt.orderid,ordt.unitprice,ordt.Quantity, prd.ProductName,prd.CategoryID
from [Order Details] ordt FULL outer JOIN Products prd
ON ordt.ProductID = prd.ProductID


---------------------------------------------------------------------------------
--28.SELF Join
---------------------------------------------------------------------------------

USE Northwind
GO
SELECT EmployeeID,LastName,ReportsTo from Employees
--emp.ReportsTo = mng.EmployeeID

SELECT emp.LastName as 'Employee Name',mng.LastName as 'Manager Name'FROM Employees emp JOIN Employees mng
ON emp.ReportsTo = mng.EmployeeID

--LEFT OUTER Join
SELECT emp.LastName as 'Employee Name',mng.LastName as 'Manager Name'FROM Employees emp LEFT OUTER JOIN Employees mng
ON emp.ReportsTo = mng.EmployeeID

--RIGHT OUTER Join
SELECT emp.LastName as 'Employee Name',mng.LastName as 'Manager Name'FROM Employees emp Right OUTER JOIN Employees mng
ON emp.ReportsTo = mng.EmployeeID

---------------------------------------------------------
--29. Sub Queries Part 1
---------------------------------------------------------
--1.Intro
--* List customers who live in the same city as customer number 170.
SELECT City from Employees where EmployeeID = 8
--Static Query:
SElect * from Employees where city = (SELECT City from Employees where EmployeeID = 7)

SELECT city, EmployeeID from Employees
--2. Guidelines
--* The subquery is executed once before the main query,then the result returned by the 
--  subquery is submitted to the main query.
--* The subquery must be unclosed by round brackets.
--* place subqueries on the right side of the comparison condition.
--* We're going to learn two types of sub queries:
--	* Single Row Subqueries
--examples:
SELECT * from Orders
SELECT  * from orders where orderid =(SELECT OrderID from Orders where Freight =0.93 )
and shipcity<>10250
--returnes a single field
SELECT  * from [Order Details] where Discount >(SELECT AVG(Discount) from [Order Details] )

SELECT hiredate from Employees where EmployeeID = 7
SELECT * from Employees where HireDate > (select HireDate from Employees where EmployeeID=7)

-----------------------------
--	* Multiple Row Subqueries
-----------------------------
--	a. Intro
-----------------------------
use master
SELECT * from [Order Details]
SELECT OrderID,ProductID,Discount,UnitPrice FROM [Order Details] WHERE Discount> (SElECT Discount from [Order Details] where OrderID=10878)

SELECT OrderID,ProductID,Discount,UnitPrice FROM [Order Details] WHERE UnitPrice> (SElECT max(UnitPrice) from [Order Details] where OrderID=11051)

SELECT OrderID,ProductID,Discount,UnitPrice FROM [Order Details] WHERE UnitPrice IN (SElECT UnitPrice from [Order Details] where OrderID=11051)

--	b. IN
-----------------------------
--	c. >ALL
-----------------------------
--Maximum
SELECT OrderID,ProductID,Discount,UnitPrice FROM [Order Details] WHERE UnitPrice >ALL (SElECT max(UnitPrice) from [Order Details] where OrderID=11051)
-----------------------------
--	c. <ALL
-----------------------------
--Minimum
SELECT OrderID,ProductID,Discount,UnitPrice FROM [Order Details] WHERE UnitPrice <ALL (SElECT UnitPrice from [Order Details] where OrderID=11051)
-----------------------------
--	d. ANY
--Average
-----------------------------
SELECT OrderID,ProductID,Discount,UnitPrice FROM [Order Details] WHERE UnitPrice =ANY (SElECT UnitPrice from [Order Details] where OrderID=11051)

--	e.>ANY
--Maximum
-----------------------------
SELECT OrderID,ProductID,Discount,UnitPrice FROM [Order Details] WHERE UnitPrice >ANY (SElECT UnitPrice from [Order Details] where OrderID=11051)

--	f.<ANY
--Minimum
-----------------------------
SELECT OrderID,ProductID,Discount,UnitPrice FROM [Order Details] WHERE UnitPrice <ANY (SElECT UnitPrice from [Order Details] where OrderID=11051)

--	g.=ANY
-----------------------------
