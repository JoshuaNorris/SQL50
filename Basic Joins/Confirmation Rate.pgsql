-- https://leetcode.com/problems/confirmation-rate/?envType=study-plan-v2&envId=top-sql-50

select s.user_id,
    round(avg(
        case
            when c.action = 'timeout' then 0
            when c.action = 'confirmed' then 1
            else 0
        end
    ), 2) as confirmation_rate
from Signups as s
full outer join Confirmations as c using (user_id)
group by s.user_id