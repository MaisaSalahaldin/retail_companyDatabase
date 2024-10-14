-- 1) Total Sales by Category

 select sum(p.Price * det.Quantity) , cat.CateogrieName
 from 
orderdetails det
join orders o on det.orderid=o.orderid
join products p on det.productId =p.productId
join cateogries cat on p.categorieId=cat.categorieId
  group by cat.CateogrieName;
  
  
  -- 2) Monthly Sales Summary
 SELECT 
    DATE_FORMAT(o.orderDate, '%Y-%m') AS saleMonth,
    COUNT(o.orderid) AS totalOrders,
    SUM(o.totalAmount) AS totalSales
FROM 
    ORDERS o
GROUP BY 
    saleMonth
ORDER BY 
    saleMonth;
    
-- 3)Total  Sales Yearly Summary
 SELECT 
    DATE_FORMAT(o.orderDate, '%Y') AS saleYearly,
    COUNT(o.orderid) AS totalOrders,
    SUM(o.totalAmount) AS totalSales
FROM 
    ORDERS o
GROUP BY 
    saleYearly
ORDER BY 
    saleYearly;
    
-- 4) Top 5 Products by Sales
    select p.productId ,p.productName,
    sum(det.Quantity) as totalSoldQuantity,
    sum(det.Quantity * p.Price) as totalPrice
    from orderdetails det
    join orders o on det.orderid=o.orderid
    join products p on det.productId=p.productId
     group by p.productId ,p.productName
     order by totalPrice desc
     limit 5; 
     
-- 5) Customer Purchase Patterns yearly
     
     select c.customerId,c.customerName, SUM(det.Quantity * p.price), DATE_FORMAT(o.orderDate, '%Y') AS saleYearly
     from orderdetails det
     join orders o on det.orderid=o.orderid
     join products p on det.productId=p.productId
     join customer c on o.customerId=c.customerId
     group by c.customerId,c.customerName,saleYearly
     order by saleYearly;
     
-- 6)Inventory Status
     select p.productId,p.productName,p.stock_quantity ,sum(det.Quantity) as totalSold
     from products p
     join orderdetails det on p.productId=det.productId
     group by productId,productName,p.stock_quantity 
     order by totalSold;
     
-- 7)Yearly Sales Comparison
      SELECT 
    year(o.orderDate) AS saleYearly,
    COUNT(o.orderid) AS totalOrders,
    SUM(o.totalAmount) AS totalSales
FROM 
    ORDERS o
    where year(o.orderDate) IN (YEAR(CURRENT_DATE), YEAR(CURRENT_DATE) - 1) 
GROUP BY 
    saleYearly
ORDER BY 
    saleYearly;


-- 8)Most Active Customers
    SELECT 
    c.customerId,
    c.customerName,
    COUNT(o.orderid) AS totalOrders
FROM 
    Customer c
JOIN 
    ORDERS o ON c.customerId = o.customerId
GROUP BY 
    c.customerId, c.customerName
ORDER BY 
    totalOrders DESC
LIMIT 5;


