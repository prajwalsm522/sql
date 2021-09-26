-- 1. List all the products
SELECT * FROM PRODUCT;

-- 2. List product name and product price
 SELECT PRODUCTNAME, PRICE FROM PRODUCT; 

-- 3. List all customers
SELECT * FROM CUSTOMER;

-- 4. List Customername and mobile no
SELECT CUSTOMERNAME, MOBILENO FROM CUSTOMER;

-- 5. List all orders
SELECT * FROM ORDERD;

-- 6. List customer id and orderd date
SELECT CUSTOMERID, ORDERDATE FROM ORDERD;

-- 7. List all the order item
SELECT * FROM ORDERITEM;

-- 8. List all the product with product id 100
SELECT * FROM product
WHERE PID = 100;

-- 9. List all the info of product with name Vivo V3
SELECT * FROM PRODUCT WHERE PRODUCTNAME = "GALAXY GRAND";

-- 10. List pid, productname, price of the phone named "S5"
SELECT PID, productname, price FROM PRODUCT WHERE PRODUCTNAME="S5";

-- 11. Print product info for all the product with category id 2003
SELECT * FROM product WHERE pid = 10003; 

-- 12. List all the customers address with city as 'Bangalore'
SELECT * from customeraddress where city='bangalore';

-- 13. List all the orders which was ordered on '2013-02-02'
select * from orderd where orderdate = '2013-02-02';

-- 14. Print all the orders of the customer with id 1
select * from orderitem where orderid=1;

-- 15. List all the product with company id 1001 or 1002
select productname, companyid from product
where companyid = 1001 or companyid = 1002;

select productname, companyid from product
where companyid = 1001 or companyid = 1002;


-- 16. List all the product with price more than 30000
select productname, price from product
where price >= 30000;

-- 17. List all the products of the category id 2001 or 2003 with
-- the price more than 30000
select productname , categoryid from product
where categoryid in (10001, 10003)
and (price >= 30000);


select * from product
where price>=30000;


-- 18. List all the order customer id 1 or 4 ordered on '2013-02-02'
-- or '2013-02-07'
select orderid, customerid,  from orderd
where customerid in (1,4)
 orderdate >= '2013-02-02' and orderdate <= '2013-02-07';


-- 19. List all the customer whos name starts with character 'A'
select * from customer
where customername like 'A%';

-- 20. List all the customer who name ends with character 'i'
select * from customer where customername like '%i';

-- 21. List all the customer whos name starts with 'R' and ends with 'i'
select * from customer where customername like 'R%i';

-- 22. List all the orders for the year 2013
select * from orderd where orderdate between '2013-01-01-' and '2013-12-31'; 

-- 23. List all the products which are not from the category 10001
select * from category where categoryid != 10001;

select * from category where categoryid not in (10001);

-- 24. List all the products which are not from the category 10001
-- or 10003 with the price more than 30000 and product name starts
-- with '6'
select * from product where categoryid not in (10001,10003) and price > 30000 and productname like '6%';

-- 25. List all the customers whos mobile no doesnt start with 9

select customername, customerid, mobileno from customer where mobileno not like '9%';

-- 26. List all the nokia phones
select * from product where companyid = (select companyid from company where companyname = 'nokia');

select p.productname, c.companyname from product p
inner join company c on 
c.companyid = p.companyid
having c.companyname='nokia';


-- 27. List all the samsung phones
select * from product where companyid = (select companyid from company where companyname ='samsung');

select p.productname, c.companyname from product p
inner join company c on 
c.companyid = p.companyid
having c.companyname = 'samsung';

-- 28. List all the iphone phones
select * from product where companyid = (select companyid from company where companyname = 'iphone');

select p.productname, c.companyname from product  p
inner join company  c on
c.companyid = p.companyid
having c.companyname = 'iphone';

-- 29. List all the customers from Bangalore
select * from customeraddress where city = 'bangalore';

select ca.customerid, o.orderid from customeraddress ca
inner join orderd o on ca.city = 'bangalore';

-- 30. List all the customers who are not from Bangalore
select * from customeraddress where city not like 'bangalore';

select * from customeraddress where customerid in ( select customerid from customeraddress where city not like 'bangalore');

-- 31. List all the customer who have orderd on the date '2013-02-02'

select c.customername, c.customerid from customer c
inner join orderd od on c.customerid = od.customerid
and od.orderdate in ( '2013-02-02');

-- 32. List all the customer who have orderd for phone '6S'
select c.customerid,c.customername, p.productname from customer c
inner join orderd od on c.customerid = od.customerid
inner join orderitem oi on od.orderid = oi.orderid
inner join product p on oi.pid = p.pid
having p.productname like '6s';

-- 33. List all the customers who have ordered for 4s from bangalore
select * from customer c inner join
customeraddress ad on c.customerid = ad.customerid inner join
orderd od on ad.customerid = od.customerid inner join
orderitem oi on od.orderid = oi.orderid inner join
product p on p.pid = oi.pid
inner join company cp on p.companyid = cp.companyid where p.productname = '4s'
having ad.city like 'bangalore';

'select c.customername, c.customerid, o.orderid, p.productname, cp.companyname from customer c
inner join orderd o on o.orderid = c.customerid
inner join orderitem oi on oi.orderid = o.orderid
inner join product p on oi.pid=p.pid
inner join company cp on p.companyid =  cp.companyid where p.productname = '4s';'*9



-- 34. List all the phones which Goutham orderd for

SELECT 
    p.productname, c.customername
FROM
    product p
        INNER JOIN
    orderitem oi ON p.pid = oi.pid
        INNER JOIN
    orderd od ON od.orderid = oi.orderid
        INNER JOIN
    customer c ON c.customerid = od.customerid
HAVING c.customername = 'goutham';

-- 35. List all the phones which Amrutha orderd for in the 2014
SELECT 
    p.productname, c.customername, od.orderdate
FROM
    product p
        INNER JOIN
    orderitem oi ON p.pid = oi.pid
        INNER JOIN
    orderd od ON od.orderid = oi.orderid
        INNER JOIN
    customer c ON c.customerid = od.customerid
HAVING c.customername = 'Amrutha' and od.orderdate between '2014-01-01-' and '2014-12-31';

-- 36. List all the customer who have not bought any product
select * from customer where customerid not in ( select customerid from orderd);


-- 37. List Fav phones of Bangalorean
SELECT 
    p.productname, c.customername, p.pid, ad.city
FROM
    product p
        INNER JOIN
    orderitem oi ON p.pid = oi.pid
        INNER JOIN
    orderd od ON oi.orderid = od.orderid
        INNER JOIN
    customeraddress ad ON ad.customerid = od.customerid
        INNER JOIN
    customer c ON ad.customerid = c.customerid
GROUP BY productname
HAVING ad.city LIKE 'bangalore';


'select p.productname, p.pid, ad.city from product p
inner join orderitem oi on p.pid = oi.pid
inner join orderd od on oi.orderid = od.orderid
inner join customeraddress ad on ad.customerid = od.customerid
group by productname having ad.city like 'bangalore';'


-- 38. List all the products which were sold in the year 2013
select productname from product where pid in( select pid from orderitem where orderid in( select orderid from orderd where orderdate between '2013-01-01' and '2013-12-31'));

select p.productname, od.orderdate from product p 
inner join orderitem oi on p.pid = oi.pid
inner join orderd od on oi.orderid = od.orderid
having od.orderdate between '2013-01-01' and '2013-12-31';


-- 39. List all the Nokia phones orderd by 'Ravi'
select productname from product where pid in 
( select pid from orderitem where orderid in (
select orderid from orderd where customerid in (
select customerid from customer where customername like 'ravi')));

-- 40. List all the phones with its company name
select  p.productname , c.companyname from product p
inner join company c on p.companyid = c.companyid;


-- 41. List companyid, companyname, productname, product price of all products

select c.companyid, c.companyname, p.productname,  p.price from company c
inner join product p on p.companyid = c.companyid;


-- 42. List customer name, stname and city of all the customer.
select c.customername, ad.stname, ad.city from customer c
inner join customeraddress ad on ad.customerid = c.customerid;

-- 43. List customer name and customer city of all the customer
-- who have never bought any product
select c.customername, ad.city from customer c
inner join customeraddress ad on c.customerid = ad.customerid
inner join orderd od on od.customerid = ad.customerid
inner join orderitem oi on oi.orderid != od.orderid;

-- 44. List Customer id, customer name, orderdate, of all the orders
select c.customerid, c.customername, od.orderdate from customer c
inner join orderd od on c.customerid = od.customerid;

-- 45. List Customer id, customer name, orderdate, company and
-- product name with qty, price of all the orders
select c.customerid, c.customername, od.orderdate, ca.companyname, p.productname from customer c
inner join orderd od on c.customerid = od.customerid
inner join orderitem oi on oi.orderid = od.orderid
inner join product p on p.pid = oi.pid
inner join company ca on ca.companyid = p.companyid;


-- 46. List Customer id, customer name, orderdate, company and
-- product name with qty, price and amount of all the orders
-- where amount is qty*price
SELECT 
    c.customerid,
    c.customername,
    od.orderdate,
    ca.companyname,
    p.productname,
    oi.qty,
    SUM(oi.qty * p.price)
FROM
    customer c
        INNER JOIN
    orderd od ON c.customerid = od.customerid
        INNER JOIN
    orderitem oi ON oi.orderid = od.orderid
        INNER JOIN
    product p ON p.pid = oi.pid
        INNER JOIN
    company ca ON ca.companyid = p.companyid
GROUP BY od.orderid
HAVING SUM(oi.qty * p.price);


/* 47. List Customer id, customer name, orderdate, company and
product name with qty, price and amount of all the orders
where amount > 50,000 (amount is qty*price) */
SELECT 
    c.customerid,
    c.customername,
    od.orderdate,
    ca.companyname,
    p.productname,
    oi.qty,
    SUM(oi.qty * p.price)
FROM
    customer c
        INNER JOIN
    orderd od ON c.customerid = od.customerid
        INNER JOIN
    orderitem oi ON oi.orderid = od.orderid
        INNER JOIN
    product p ON p.pid = oi.pid
        INNER JOIN
    company ca ON ca.companyid = p.companyid
GROUP BY od.orderid
HAVING SUM(oi.qty * p.price) > 50000;


/* 48. List customerid, customername, city, companyname, productname,
qty, price and amount of all the products orderd */
select c.customerid, c.customername, ad.city, ca.companyname, p.productname, oi.qty, p.price, SUM(oi.qty*p.price)  from customer c
inner join customeraddress ad on ad.customerid = c.customerid
inner join orderd od on od.customerid = ad.customerid
inner join orderitem oi on oi.orderid = od.orderid
inner join product p on p.pid = oi.pid
inner join company ca on ca.companyid = p.companyid
group by p.pid
order by c.customerid;



/* 49. List all product, company, customer and
customer address details for all orders
which were ordered in the year 2014
*/

select p.productname, ca.companyname, c.customername, ad.city, od.orderdate, p.pid from customer c
inner join customeraddress ad on ad.customerid = c.customerid
inner join orderd od on od.customerid = ad.customerid
inner join orderitem oi on oi.orderid = od.orderid
inner join product p on p.pid = oi.pid
inner join company ca on ca.companyid = p.companyid
having od.orderdate between '2014-01-01' and '2014-12-31';



/* 50. Update amount of order item */
update orderitem
set amount = 2000
where pid = 100;

/* 51. Get the total sales based on orderid */
select count(*) from orderitem;

/* 52. Get the total sales based on given month */
select year(orderdate), month(orderdate),  count(orderid) as Total_sales from orderd
group by month(orderdate);

select month(orderdate),count(orderid) as total_sales from orderd 
where month(orderdate)='12';

/* 53. Get the total sales based on year */
select year(orderdate), count(orderid) as Total_sales from orderd
group by year(orderdate);

select year(orderdate),count(orderid) as total_sales from orderd 
where year(orderdate)='2013';

/* 54. Get the total sales based on month and year */
select year(orderdate), month(orderdate),  count(orderid) as Total_sales from orderd
group by month(orderdate);

/* 55. Total sales based on product */
select p.productname, count(*) as totalsales from product p
inner join company c on c.companyid = p.companyid inner join
orderitem oi on p.pid = oi.pid
group by p.productname;



/* 56. Total sales based on company */
select c.companyname, count(qty) as total_sale from company c
inner join product p on c.companyid = p.companyid inner join
orderitem oi on p.pid = oi.pid
group by c.companyname;

/* 57. Display top 3 sold mobiles */
select p.productname, sum(p.price), count(oi.qty), p.pid from product p
inner join orderitem oi on oi.pid = p.pid
group by productname
order by sum(p.price) desc limit 3;

/*select p.productname, sum(price) from product p 
group by productname 
order by sum(price) desc limit 3;*/


/* 58. Top 3 customers based on billing amount */
select c.customername, p.price, p.pid, p.productname, oi.qty from customer c
inner join orderd od on od.customerid = c.customerid
inner join orderitem oi on oi.orderid = od.orderid
inner join product p on p.pid = oi.pid
group by p.pid
order by sum(p.price) desc limit 3;


/* 59. Top 3rd customer based on billing amount */
select DISTINCT(productname) from product;

/* 60. Display all unique phones which are sold */
 select DISTINCT(productname) from product;

/* 61. Display all phones which are sold with the no. of quantity */
select p.productname,oi.qty from orderitem oi 
inner join product p on p.pid=oi.pid
group by p.productname;

/* 62. Name of the top priced phone */
select max(price) as top_priced,productname from product;