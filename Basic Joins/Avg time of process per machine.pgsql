-- https://leetcode.com/problems/average-time-of-process-per-machine/?envType=study-plan-v2&envId=top-sql-50


select a.machine_id,
       round(avg(diff.diff)::numeric, 3) AS processing_time
from Activity as a
join (
    select s.machine_id, s.process_id,
           (e.timestamp - s.timestamp) as diff
    from (
        SELECT * from Activity Where activity_type = 'start'
    ) as s
    join (
        SELECT * from Activity Where activity_type = 'end'
    ) as e on (e.machine_id = s.machine_id and e.process_id = s.process_id)
) as diff on (diff.machine_id = a.machine_id and diff.process_id = a.process_id)
group by a.machine_id

-- This was not the best approach... below are much better solutions from @jasurbekaktamov081

select a1.machine_id, round(avg(a2.timestamp-a1.timestamp), 3) as processing_time 
from Activity a1
join Activity a2 
on a1.machine_id=a2.machine_id and a1.process_id=a2.process_id
and a1.activity_type='start' and a2.activity_type='end'
group by a1.machine_id

select 
a.machine_id,
round(
      (select avg(a1.timestamp) from Activity a1 where a1.activity_type = 'end' and a1.machine_id = a.machine_id) - 
      (select avg(a1.timestamp) from Activity a1 where a1.activity_type = 'start' and a1.machine_id = a.machine_id)
,3) as processing_time
from Activity a
group by a.machine_id