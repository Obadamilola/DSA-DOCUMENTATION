Create Database K
MSab

---------------create table -------------------

CREATE TABLE KMS_ORDERS (
[Row_ID] INT,
[Order_ID] INT,
[Order_Date] DATE,
[Order_Priority] VARCHAR (50),
[Order_Quantity] INT,
Sales DECIMAL(10,2),
Discount DECIMAL(10,2),
[Ship_Mode] VARCHAR (50),
Profit DECIMAL(10,2),
Unit_Price DECIMAL(10,2),
[Shipping_Cost] VARCHAR (255),
[Customer_Name] VARCHAR (255),
Province VARCHAR (100),
Region VARCHAR (100),
[Customer_Segment] VARCHAR (100),
[Product_Category] VARCHAR (100),
[Product_Sub-Category] VARCHAR (100),
[Product_Name]VARCHAR (MAX),
[Product_Container] VARCHAR (100),
[Product_Base Margin] DECIMAL(10,2),
[Ship_Date] DATE,
)

------IMPORT CSV FILES INTO DB-------


select * from [dbo].[KMS Sql Case Study]
select * from [dbo].[Order_Status]
1.Which product category had the highest sales? 

SELECT product_category,sum (sales) as total_sales
from [dbo].[KMS Sql Case Study]
Group by Product_category
Order by total_sales DESC 

Answer- The product category table that has the highest sales is Technology.

2. What are the Top 3 and Bottom 3 regions in terms of sales? 
------Top 3 region in sales-------
Select Top 3 region, sum (sales) as total_sales
From [dbo].[KMS Sql Case Study]
Group by region
Order by total_sales DESC

-------Bottom 3 regions in sales -----
Select Top 3 region, sum (sales) as total_sales
From [dbo].[KMS Sql Case Study]
Group by region
Order by total_sales ASC;

Answer
a.The top 3 regions in termsof sales are; West, Ontario and Prarie.
b.The bottom 3 regions in terms of sales are; Nunavut, Northwest Territories and Yukon.


3.What were the total sales of appliances in Ontario?
---------Total sales of appliances Ontario-------
Select Product_sub_Category, Sum (sales) as total_sales
From [dbo].[KMS Sql Case Study]
where region = 'Ontario'
Group by Product_sub_category

Answer- Total sales of appliances Ontario is 202346.84

4.Advise the management of KMS on what to do to increase the revenue from the bottom 
10 customers
Select top 10 Customer_name, Profit, Product_category, Product_container, Sum (sales) as total_sales
From [dbo].[KMS Sql Case Study]
Group by Customer_name, Profit, Product_category, Product_Container
Order by Total_sales ASC;

Answer: In order for management to increase the the revenue from bottom customers;they have to:
-Giving promotion and educating customers. 
Management can encourage purchasing higher-margin items by offering cross selling offers, giving out loyalty programs and special offers to customers.
Educate via email campaings, flyers of better value bundles that increases efficiency and cost effectiveness.
- Optimizing shipping strategies. This can be done by matching shipping modes with order priority and value 
e.g usage of Delivery Trucks for low value and less urgent orders.
-Reduction of operating loss from unprofitable customers
-The management are to investigae further which office supplies are causing losses.
- Price adjustment can also be considered if the product category are consistently unprofitable.

Answer- In order for management to increase the the revenue from bottom customers;
1
select * from [dbo].[KMS Sql Case Study]

5. KMS incurred the most shipping cost using which shipping method? 
Select Ship_Mode, sum(Shipping_Cost) as [Total shipping_Cost]
from [dbo].[KMS Sql Case Study]
Group by Ship_Mode
Order by [Total shipping_cost] DESC

Answer- The most shipping method is Delivery Truck at total shipping cost of 51971.94

6. Who are the most valuable customers, and what products or services do they typically 
purchase? 

Select Top 10 Customer_segment, Product_sub_category, Customer_name, sum (sales) as total_sales
From [dbo].[KMS Sql Case Study]
Group by Customer_segment, Product_sub_category, Customer_name
Order by total_sales DESC;

Answer- The most valuable customers are; Emily Phan
Raymond Book, Dennis Kane, Jasper Cacioppo, Grant Carroll, Clytie Kelty, Craig Carreira, Roy Skaria
Roy Phan, Lisa DeCherney 
The service the typically purchase are; Office Machines, Copiers and Fax,Binders and Binder Accessories
, Bookcases, Office Machines, Tables.

7. Which small business customer had the highest sales? 

Select Top 1*
From [dbo].[KMS Sql Case Study]
Where Customer_segment ='Small Business'
Order by Sales DESC

Answer: Dennis Kane 

8. Which Corporate Customer placed the most number of orders in 2009 – 2012? 
Select Top 1*
From [dbo].[KMS Sql Case Study]
Where Customer_segment='corporate'
Order by [Order_Quantity] DESC

Answer: Sonia Cooley

9.	Which consumer customer was the most profitable one? 
Select Top 1*
From [dbo].[KMS Sql Case Study]
Where Customer_segment='consumer'
Order by [Profit] DESC
Answer: Emily Phan

10. Which customer returned items, and what segment do they belong to?
select Customer_Name, Customer_Segment, Product_Sub_Category,Product_Category 
from [dbo].[KMS Sql Case Study]
join [dbo].[Order_Status]
on [dbo].[KMS Sql Case Study].[Order_ID] =[dbo].[Order_Status].[Order_ID]

11. If the delivery truck is the most economical but the slowest shipping method and 
Express Air is the fastest but the most expensive one, do you think the company 
appropriately spent shipping costs based on the Order Priority? Explain your answer 

SELECT 
    Order_Priority,
    Ship_Mode,
    COUNT(*) AS Total_Orders,
    AVG(Shipping_Cost) AS Avg_Shipping_Cost
FROM [dbo].[KMS Sql Case Study]
GROUP BY Order_Priority, Ship_Mode
ORDER BY Order_Priority, Ship_Mode;

The company is not appropriately spending on shipping costs based on Order Priority.
For instance, critical orders that are urgent requires the fastest delivery mode whereas, they mostly use slow, yet expensive Delivery Truck.
This therefore suggests failure to appropriately priortize urgency by the Company.
Furthermore, Low and Medium orders which has less urgent order priority often make use of the faster and costly methods. 
This clearly represents inefficient use of shipping resources, and urgency of orders are not well priortized.
In conclusion, high costs that are associated with delivery truck shipment poses issues of cost tracking and shipment contracts.