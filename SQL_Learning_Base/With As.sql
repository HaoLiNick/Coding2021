-- Decile and WITH

select *,
netile(10) over (order by scores desc) as decile
from 

with resp_scores as (
select *

--Example 1:  Find all the employee whose salary is more than the average salary of all employees.
--Name of the relation: Employee

--EmployeeID--Name--Salary
--100011--Smith--50000
--100022--Bill--94000
--100027--Sam--70550
--100845--Walden--80000
--115585--Erik--60000
--1100070--Kate--69000

WITH temporaryTable(averageValue) as
    (SELECT avg(Salary)
    from Employee), 
        SELECT EmployeeID,Name, Salary 
        FROM Employee, temporaryTable 
        WHERE Employee.Salary > temporaryTable.averageValue;
----
--Use comma not semi-colon


--Example 2: Find all the airlines where the total salary of all pilots in that airline 
--is more than the average of total salary of all pilots in the database.

--Name of the relation: Pilot

--EmployeeID--Airline--Name--Salary
--70007--Airbus 380--Kim--60000
--70002--Boeing--Laura--20000
--10027--Airbus 380--Will--80050
--10778--Airbus 380--Warren--80780
--115585--Boeing--Smith--25000
--114070--Airbus 380--Katy--78000

WITH totalSalary(Airline, total) as
    (SELECT Airline, sum(Salary)
    FROM Pilot
    GROUP BY Airline),
    airlineAverage(avgSalary) as 
    (SELECT avg(Salary)
    FROM Pilot )
    SELECT Airline
    FROM totalSalary, airlineAverage
    WHERE totalSalary.total > airlineAverage.avgSalary;
--
--In general; A CTE can be used recursively; a sub-query cannot. This makes them especially well suited to tree structures.

Order like below:
--FROM
--ON
--JOIN
--WHERE
--GROUP BY
--WITH CUBE or WITH ROLLUP
--HAVING
--SELECT
--DISTINCT
--ORDER BY
--TOP