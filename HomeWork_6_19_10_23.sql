use shop;
select * from customers;
select * from orders;
select * from sellers;

/*
1.Выведите имена покупателей, которые совершили покупку на сумму больше 1000 условных единиц.
В выборке должно присутствовать два атрибута — cname, amt.
*/
SELECT 
t1.CNAME,
t2.AMT
FROM CUSTOMERS t1
LEFT JOIN ORDERS t2
ON t1.CUST_ID = t2.CUST_ID
where t2.AMT > 1000;

/*
3.Для каждого сотрудника выведите разницу между комиссионными его босса и его собственными. 
Если у сотрудника босса нет, выведите NULL.
Вывести : sname, difference.
*/
SELECT 
t1.SNAME,
t1.COMM SELLER_COMM,
t2.SNAME BOSS_NAME,
t2.COMM BOSS_COM,
t2.COMM - t1.COMM difference 
FROM sellers t1
LEFT JOIN SELLERS t2
ON t1.BOSS_ID = t2.SELL_ID;

/*
4.Выведите пары покупателей и обслуживших их продавцов из одного города.
Вывести: sname, cname, city
*/
SELECT 
t1.CNAME,
t1.CITY,
t2.SNAME,
t2.CITY
FROM CUSTOMERS t1 
	INNER JOIN ORDERS t3
	ON t1.CUST_ID = t3.CUST_ID
		INNER JOIN SELLERS t2
		ON  t3.SELL_ID = t2.SELL_ID
		where t1.CITY = t2.CITY;