-- Write your PostgreSQL query statement below

select e.name, eu.unique_id
from Employees as e
Left Join EmployeeUNI as eu using(id)