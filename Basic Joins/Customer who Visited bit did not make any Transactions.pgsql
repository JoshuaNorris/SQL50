-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/?envType=study-plan-v2&envId=top-sql-50

select v.customer_id, count(v.customer_id) as count_no_trans
from Visits as v
left join Transactions as t using (visit_id)
group by v.customer_id, t.visit_id
    having t.visit_id is null