
--tổng doanh thu có đc--
select sum(total_price)
from pizza_table

--Doanh thu theo tháng--
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(total_price) AS revenue
FROM pizza_table
GROUP BY month
order by month;

--giá trị trung bình của một order--
SELECT SUM(total_price) / COUNT (DISTINCT order_id)  AS AVG_Order_Value
from pizza_table

--những món ăn đc order nhiều nhất--
select count(pizza_name_id) as order,
       pizza_name_id
from pizza_table
group by pizza_name_id
ORDER BY  count(pizza_name_id)

select sum(total_price) as revenue,
       pizza_name_id
from pizza_table
group by pizza_name_id
order by revenue





ALTER TABLE pizza_table
ADD COLUMN AVG_Order_Value int

update pizza_table
set AVG_Order_Value = (SELECT SUM(total_price) / COUNT (DISTINCT order_id)
from pizza_table)

select *
from pizza_table