-- https://github.com/eirkostop/SQL-Northwind-exercises/blob/master/Querying-the-database-General-Exercises-Part-1.pdf

-- select all category with their desc from the categories table.
select distinct category_name, description from categories;

-- select contact name, customer id, company name from all customers in london.
select customer_id, company_name, contact_name
	from customers
	where city = 'London';
	
-- select all available columns in the suppliers tables that have a FAX number.
select * from suppliers
	where fax is not null;

-- select a list of cust from orders table with required dates btwn Jan 1, 1997 and Jan 1, 1998 and with freight under 100 units.
select * from orders
where required_date between '1997-01-01' and '1998-01-01' and freight < 100;

-- select a list of company names of all owners from the cust table from mexico, sweden and germany
select company_name from customers
where country = 'Sweden' or country ='Germany' or country ='Mexico';

-- count the number of discontinued products in products table
select count(*) from products
where discontinued = 1;

-- select a list of category names and desc of all the categories begining with 'Co' from categories table.
SELECT Category_Name, Description
FROM Categories
WHERE Category_Name LIKE 'Co%';

-- 8th Select the product id and the total quantities ordered for each product id in the Order Details table.
select company_name, city, country, postal_code, address 
from suppliers
where address like '%rue%'
order by company_name;

-- 9th Select the product id and the total quantities ordered for each product id in the Order Details table.
select product_id, sum(quantity)
from order_details
group by product_id;

-- 10th Select the customer name and customer address of all customers with orders that shipped using Speedy Express.
select distinct(c.contact_name), c.address 
from customers c join orders o
on c.customer_id = o.customer_id
JOIN Shippers s
ON o.Ship_Via = s.Shipper_ID
where s.company_name = 'Speedy Express';

-- 11th Select a list of Suppliers containing company name, contact name, contact title and region description.
SELECT Company_Name, Contact_Name, Contact_Title, Region
FROM Suppliers
WHERE Contact_Name IS NOT NULL AND Contact_Title IS NOT NULL AND Region IS NOT NULL;

-- 12th Select all product names from the Products table that are condiments.
select p.product_name, c.category_name 
from products p join categories c
on p.category_id = c.category_id
where category_name = 'Condiments';

-- Exercise #13
--Select a list of customer names who have no orders in the Orders table.
select contact_name 
from customers 
where customer_id not in (select distinct customer_id from orders);

-- Exercise #14
--Add a shipper named 'Amazon' to the Shippers table using SQL.
UPDATE Shippers 
SET Company_Name = 'Amazon Shipping'
WHERE Company_Name =  'Amazon';

--Exercise #16
--Select a complete list of company names from the Shippers table. 
--Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.
select s.company_name, sum(freight)
from shippers s join orders  o
on s.shipper_id = o.ship_via
group by s.company_name;

--Exercise #17
--Select all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'.
--The combined format should be 'LastName, FirstName'.
select concat(last_name, ' ' ,first_name) as display_name
from employees;

--Exercise #18
--Add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.


--Exercise #20
--Select a list of products from the Products table along with the total units in stock for each product.
--Give the computed column a name using the alias, 'TotalUnits'. Include only products with TotalUnits greater than 100.
select units_in_stock, product_name
from products
where units_in_stock > 100;