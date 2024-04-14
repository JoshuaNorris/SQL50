-- https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&envId=top-sql-50


SELECT w1.id AS "Id"
FROM Weather AS w1
CROSS JOIN Weather AS w2
WHERE w1.temperature > w2.temperature
    AND DATE_TRUNC('day', w1.recordDate) - DATE_TRUNC('day', w2.recordDate) = INTERVAL '1 day';
