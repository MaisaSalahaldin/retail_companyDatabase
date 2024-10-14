-- Retail Database
   create Database retail_company;
   use retail_company;
   -- create Tables 
   create table Products(
   productId int primary key AUTO_Increment ,
   productName VARCHAR(100) NOT NULL,
   categorieId int ,
	price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    FOREIGn key (categorieId) REFERENCES Cateogries(categorieId)
   );
   create table Customer(
   customerId int Auto_Increment PRIMARY key,
   customerName varchar(100) ,
   email text not null,
   phone text not null
   );
   create table Cateogries(
   categorieId int primary key auto_increment ,
   CateogrieName varchar(50) not null
   );
   
   create table Suppliers (
   supplierId int primary key auto_Increment ,
   supplierName varchar(50) not null,
   phone text 
   );
   create table ORDERS(
   orderid int AUTO_INCREMENT PRIMARY KEY,
   customerId int not null,
   orderDate  DATETIME DEFAULT CURRENT_TIMESTAMP ,
   totalAmount  DECIMAL(10, 2) NOT NULL,
   FOREIGN KEY (customerId) REFERENCES Customer(customerId))
   ;
   
   create table OrderDetails(
   OrderDetailID int auto_increment primary key,
   orderid int not null,
   productId int not null,
   Quantity int ,
   Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (orderid) REFERENCES ORDERS(orderid),
     FOREIGN KEY   (productId)   REFERENCES Products(productId));
     
-- Insert Example Data

INSERT INTO cateogries (CateogrieName) VALUES ('Electronics'), ('Clothing'), ('Groceries');
INSERT INTO Products (productName, categorieId, price, stock_quantity) VALUES
('Smartphone', 1, 699.99, 50),
('Laptop', 1, 999.99, 30),
('T-Shirt', 2, 19.99, 100),
('Jeans', 2, 39.99, 80),
('Milk', 3, 1.49, 200),
('Bread', 3, 2.99, 150);

INSERT INTO customer (customerName, email, phone) VALUES
('Maysa salah', 'Maysa@gmail.com', '314-386-0101'),
('May Joo', 'May@gmail.com', '314-322-7921');
INSERT INTO ORDERS (customerId, totalAmount) VALUES
(1, 739.98),  
(1, 39.99),  
(2, 439.85), 
(2, 8.96);  
INSERT INTO orderdetails (orderid, productId, Quantity, price) VALUES
(1, 1, 1, 699.99), 
(1, 4, 1, 39.99),  
(2, 4, 1, 39.99),  
(3, 3, 8, 159.92), 
(3,4,7,279.93),
(4,5,2,2.98),
(4,6,2,5.98);

INSERT INTO Suppliers(supplierName ,phone) values ('david jo','314-234-7658'),('meio ki','234-343-3434'),('sam not','214-234-23456');
INSERT INTO ORDERS (customerId, orderDate, totalAmount) VALUES
(2, '2022-11-11 14:00:00', 19.99),  -- November 2022 
(1, '2023-01-15 10:00:00', 999.99),  -- January 2023  
(1, '2023-02-20 11:30:00', 59.98),   -- February 2023 
(2, '2022-11-10 14:00:00', 19.99),  -- November 2022 
(2, '2022-03-05 09:45:00', 999.99);   -- March 2023 
INSERT INTO OrderDetails (orderid, productId, Quantity, Price) VALUES
(10,3,1,19.99),
(5, 2, 1,999.99),  
(6, 4, 1, 59.98),  
(7, 3, 1, 19.99),   
(8, 2, 1, 999.99);  

