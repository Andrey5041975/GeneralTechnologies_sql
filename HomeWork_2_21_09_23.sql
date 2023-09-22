use airport;

select id, 
service_class, 
price, 
CASE
	WHEN  price >= 10000  and price <= 11000
		THEN   'Economy' 
	WHEN price >= 20000 and price <= 30000
		THEN  'PremiumEconomy'
	WHEN price > 100000
		THEN  'Business'
END AS price_group 
 from tickets;

select 
side_number, 
production_year,
2023 - production_year as age,
CASE
	WHEN production_year < 2000
		THEN 'Old'
	WHEN production_year >= 2000 AND production_year <= 2010
		THEN 'Mid'
	WHEN production_year > 2010 
		THEN 'New'
END
from airliners
order by age; 


select * 
from tickets;

select id,
	trip_id,
    price,
   service_class,
   price * CASE
    WHEN service_class = 'Economy'
		THEN  0.85
    WHEN service_class = 'Business'
		THEN  0.9
	WHEN service_class = 'PremiumEconomy'
		THEN  0.8
    END  as new_price
from tickets
	where trip_id in('LL4S1G8PQW' , '0SE4S0HRRU', 'JQF04Q8I9G'); 
    
    use hr;
    
    SELECT * 
    FROM employees
    WHERE first_name like 'D%'
    order by first_name;
 
select 
first_name,
last_name,
salary,
case
	when salary <= 10000
    then 0
	else 1
end as salary_group
from employees;