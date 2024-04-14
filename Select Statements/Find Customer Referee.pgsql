-- Write your PostgreSQL query statement below

SELECT name
from Customer
where not referee_id = '2' or referee_id is null;