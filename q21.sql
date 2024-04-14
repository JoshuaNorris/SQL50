-- https://leetcode.com/problems/immediate-food-delivery-ii/?envType=study-plan-v2&envId=top-sql-50

select round(AVG (
    case
        when d.order_date = d.customer_pref_delivery_date then 1
        else 0
    end)::numeric, 4) * 100 as immediate_percentage
FROM Delivery as d
join (
    select customer_id, min(order_date) as first_order
    FROM Delivery
    group by customer_id
) as f on (f.customer_id = d.customer_id) and (f.first_order = d.order_date)