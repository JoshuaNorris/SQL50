-- https://leetcode.com/problems/game-play-analysis-iv/?envType=study-plan-v2&envId=top-sql-50

with first_logins as (
    select player_id, min(event_date) as event_date
    from Activity
    group by player_id
),
next_day_logins as (
    select a.player_id, a.event_date
    from Activity as a
    join first_logins as fl
    on (a.player_id = fl.player_id and fl.event_date + INTERVAL '1 day' = a.event_date)
),
to_be_averaged as (
    select distinct a.player_id, 
        case when nd.event_date is null then 0 else 1 end as fraction
    from Activity as a
    left join next_day_logins as nd using (player_id)
)
select round(avg(fraction), 2) as fraction
from to_be_averaged