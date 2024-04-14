-- https://leetcode.com/problems/queries-quality-and-percentage/submissions/1229891870/?envType=study-plan-v2&envId=top-sql-50

select query_name, round(avg(rating / position::numeric), 2) as quality,
    round(avg(
        case
            when rating < 3 then 1
            else 0
        end
    ), 4) * 100 as poor_query_percentage
from Queries
where query_name is not null
group by query_name