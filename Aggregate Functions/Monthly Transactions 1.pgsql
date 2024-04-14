-- https://leetcode.com/problems/monthly-transactions-i/?envType=study-plan-v2&envId=top-sql-50

select  TO_CHAR(trans_date, 'YYYY-MM') as month,
        country,
        count(state) as trans_count,
        COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
        sum(amount) as trans_total_amount,
        sum(CASE WHEN state = 'approved' THEN amount else 0 END) AS approved_total_amount
from Transactions
group by month, country