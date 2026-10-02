-- Queries 

select *
from sales_data;

-- Total Sales by region
select Region, sum(totalamount) as total_sales
from sales_data
group by region
order by total_sales desc;

-- Avg Order Value by Category
select category, avg(totalamount) as avg_order
from sales_data
group by category
order by avg_order desc;

-- Top 10 customers
select customerid, sum(totalamount) as total_spent
from sales_data
group by customerid
order by total_spent desc
limit 10;

-- Monthly Sales Trend
select date_format(orderdate, '%Y-%m') as month, 
sum(totalamount) as monthly_sales
from sales_data
group by month
order by month;

-- Sales by Channel and Payment Method
select saleschannel, paymentmethod, count(*) as orders,
sum(totalamount) as revenue
from sales_data
group by saleschannel, paymentmethod
order by revenue desc;

-- Best Selling products
select product, sum(quantity) as units_sold, sum(totalamount) as revenue
from sales_data
group by product
order by units_sold desc
limit 10;

-- Discount Impact Analysis
select discountpct, count(*) as orders, avg(totalamount) as avg_orders
from sales_data
group by discountpct
order by discountpct;

-- Sales by Gender and Life Stage
select gender,
	case when age<25 then 'Young'
		 when age<40 then 'Young Adult'
		 when age<55 then 'Adult'
         else 'Senior'
		end as LifeStage,
		sum(totalamount) as revenue
from sales_data
group by gender, LifeStage
order by revenue desc;

-- Region + Category cross-tab
select region, category, sum(totalamount) as revenue
from sales_data
group by region, category
order by region, revenue desc;

-- Customers with > 1 order
select customerid, count(*) as orders
from sales_data
group by customerid
having count(*) > 1
order by orders desc;