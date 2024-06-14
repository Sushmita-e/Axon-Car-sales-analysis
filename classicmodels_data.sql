SELECT * FROM odin_aug.order;

use classicmodels

select count(*) from orders 
where status = "cancelled"

select * from orders 

-- Total sales --- 

select sum(amount) as TotalSales from payments

-- Total Average -- 

select avg(amount) as AvgSales from payments

-- Total Profit -- 

select sum((od.quantityOrdered * od.priceEach) - od.quantityOrdered* p.buyPrice) as TotalProfit
from orders o join orderDetails od on od.orderNumber = o.orderNumber
join products p on od.productCode = p.productCode


-- Total sales by country --

select sum(p.amount) as TotalSales, c.country from customers c
join payments p on c.customerNumber = p.customerNumber
group by country


-- sales by productLines ----

select sum(quantityOrdered),productLine as Quantity from orderdetails od
join products p on od.productCode = p.productCode
group by productLine

-- total cost ---

SELECT SUM(od.quantityOrdered * p.buyPrice) AS TotalCost FROM   orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber 
JOIN products p ON od.productCode = p.productCode

-- Customers Transactions per Year

select year(orderDate) as years ,  count(distinct c.customerNumber) as Numofcustomers
from orders as o
join customers as c on o.customerNumber = c.customerNumber
where o.status = "shipped"
group by years

-- Avg buyprice of each product ----

select p.productCode, avg(buyPrice), avg(priceEach) from products p 
join orderdetails od on p.productCode = od.productCode
group by p.productCode

-- # Top 5 products -----------------------


select p.productCode, productName, sum(quantityOrdered * PriceEach) as Total_Sales
from products p
join orderdetails o on p.productCode = o.productCode
group by p.productCode, productName
order by Total_Sales desc
Limit 5

-- Total orders by order status -- 
select count(orderNumber) as TotalOrders, status 
from orders 
group by status


 -- Top 5 products by quantity ordered --
 select p.productName,sum(quantityOrdered) as QuantityOrdered from orderdetails od 
 join products p on od.productCode = p.productCode
 group by p.productName
 order by QuantityOrdered desc
 limit 5


-- Top 10 products by orders ---

 select p.productName,count(quantityOrdered) as QuantityOrdered from orderdetails od 
 join products p on od.productCode = p.productCode
  group by p.productName
  order by QuantityOrdered desc
  limit 10

-- Cutomers by country -- 
select count(customerNumber) as Customers,country
from customers 
group by country

-- Number employees by Job title -- 
select count(employeeNumber) as EMployees,jobtitle from Employees
group by jobtitle


-- Employees by country -- 
select count(employeeNumber) as Employees,country
from Employees e  join offices o on e.officeCode = o.officeCode
group by country

select count(quantityOrdered) from orderdetails 

-- Total profit by Country --

select sum((od.quantityOrdered * od.priceEach) - od.quantityOrdered* p.buyPrice) as TotalProfit,country
from orders o join orderDetails od on od.orderNumber = o.orderNumber
join products p on od.productCode = p.productCode
join customers c on c.customerNumber = o.customerNumber
group by country

