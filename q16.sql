-- https://leetcode.com/problems/average-selling-price/?envType=study-plan-v2&envId=top-sql-50

select p.product_id,
       coalesce(round(sum(p.price * s.units)::numeric / sum (units), 2), 0) as average_price
from Prices as p
full outer join UnitsSold as s 
	on p.product_id = s.product_id 
	and s.purchase_date between p.start_date and p.end_date
group by p.product_id
order by p.product_id