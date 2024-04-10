-- https://leetcode.com/problems/employee-bonus/submissions/1228032766/?envType=study-plan-v2&envId=top-sql-50

select e.name, b.bonus
from Employee as e
left join Bonus as b using (empId)
where b.bonus < 1000 or b.bonus is null