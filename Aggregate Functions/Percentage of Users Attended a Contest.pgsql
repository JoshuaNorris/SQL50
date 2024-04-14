-- https://leetcode.com/problems/percentage-of-users-attended-a-contest/?envType=study-plan-v2&envId=top-sql-50

select r.contest_id, round((count(user_id) / u.count::numeric), 4) * 100 as percentage
from Register as r
join (
    select user_id, count(user_id) OVER (RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
    FROM Users
) as u using (user_id)
group by r.contest_id, u.count
order by percentage desc, contest_id asc