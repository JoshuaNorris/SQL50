-- https://leetcode.com/problems/not-boring-movies/?envType=study-plan-v2&envId=top-sql-50

SELECT *
from Cinema
where id%2 = 1 and description != 'boring'
order by rating desc