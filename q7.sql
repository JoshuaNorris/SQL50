-- Write your PostgreSQL query statement below

select p.product_name, s.year, s.price
from Product as p
join Sales as s using (product_id)