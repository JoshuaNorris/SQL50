-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50

select e.name
from Employee as e
join (
    select managerId, count(managerId)
    from Employee
    group by managerID
) as m on (m.managerID = e.id)
where m.count > 4