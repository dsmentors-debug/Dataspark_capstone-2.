


SELECT * FROM datasparkgb.sales_records;
SELECT * FROM datasparkgb.product_records;
SELECT * FROM datasparkgb.exchange_records;
SELECT * FROM datasparkgb.customer_records;
SELECT * FROM datasparkgb.stores_records;

-- 1.
 Total Revenue by Gender
SELECT c.Gender, SUM(s.Quantity * p.Unit_Price_USD) As TotalRevenue
From sales_records s
JOIN product_records p ON s.ProductKey = p.ProductKey
JOIN customer_records c ON s.CustomerKey = c.CustomerKey
GROUP BY c.Gender ORDER BY TotalRevenue DESC;


--2- Total sales revenue brand  wise
SELECT p.Brand,p.Subcategory, (s.Quantity * p.Unit_Price_USD) AS TotalRevenue
FROM sales_records s 
join product_records p on s.ProductKey = p.ProductKey
join customer_records c on s.CustomerKey =c.CustomerKey
group by p.Brand,p.Subcategory, s.Quantity, p.Unit_Price_USD order by TotalRevenue DESC;


-- 3.-
store count

SELECT * FROM datasparkgb.stores_records;
select Country,State,count(All Square_Meters) 
from stores_records
group by Country,State,Square_Meters;

4.year wise revenue

select p.productKey, p.Product_Name,
p.Unit_Price_USD,
p.Unit_Cost_USD,
s.Quantity,
s.Order_Date,
sum(s.Quantity * p.Unit_Price_USD) as
Totalrevenue
FROM product_records p inner join sales_records s
on p.productKey =s.productKey
group by p.productKey,
p.Product_Name,
p.Unit_Price_USD,
p.Unit_Cost_USD,
s.Quantity,
s.Order_Date;

--5-- City and Gender wise customer count

SELECT City,Gender, COUNT(*) AS customer_count from customer_records
AS Count group by City,Gender order by customer_count DESC;

6.select 
Continent,Country,State,City,
Count(CustomerKey) As Customer_count
from customer_records
group by Continent,Country,State,City
order by Customer_count DESC

7. Highest ordered quantity of product category

select Product_Name,Category,Unit_Cost_USD,
Unit_Price_USD, Quantity,(p.Unit_Price_USD * s. Quantity) as TotalRevenue
from sales_records as s join product_records as p on s.ProductKey = p.ProductKey 
order by TotalRevenue DESC;

-- 8. Top 10 total revenue by product name
select p.Product_Name,
Unit_Price_USD,
s.Quantity,
sum(p.Unit_Price_USD * s. Quantity) as TotalRevenue 
from sales_records s
join product_records as p on s.ProductKey = p.ProductKey
join customer_records c on c.CustomerKey = s.CustomerKey
group by Product_Name,Unit_Price_USD,
s.Quantity
order by TotalRevenue  DESC;


9. Shopping behaviour based on age group

select p.Product_Name, Brand, c.Age,c.AgeGroup,Category
from product_records as p
inner join sales_records as s on p. ProductKey =s.ProductKey
inner join customer_records as c on c.CustomerKey = s.CustomerKey;


--10.--
Month wise order performance

select p.productKey, p.Product_Name,
p.Unit_Price_USD,
p.Unit_Cost_USD,
s.Quantity,
s.Order_Date,
sum(s.Quantity * p.Unit_Price_USD) as
Totalrevenue
FROM product_records p inner join sales_records s
on p.productKey =s.productKey
group by p.productKey,
p.Product_Name,
p.Unit_Price_USD,
p.Unit_Cost_USD,
s.Quantity,
s.Order_Date;


----------------------------------------
- ---
