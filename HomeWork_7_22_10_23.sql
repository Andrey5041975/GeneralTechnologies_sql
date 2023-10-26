/*
 1 уровень сложности: 1.Используем БД uni (скрипт создания представлен на уроке)
Вывести имя студента и имена  старост, которые есть на курсах, которые он проходит
*/
use uni;
select * from students;
select * from courses;
select * from students2courses;

select 
t1.id, 
t1.name,
t2.student_id,
t2.course_id,
t3.headman_id, 
t4.name as headman_name
from students t1
	inner join students2courses t2
    on t1.id = t2.student_id
		inner join courses t3
        on t2.course_id = t3.id
			inner join students t4
            on t3.headman_id = t4.id;
			
/*
2.Используем БД shop :
Выведите имена покупателей, которые сделали заказ.
Предусмотрите в выборке также имена продавцов.
Примечание: покупатели и продавцы должны быть из разных городов.
В выборке должно присутствовать два атрибута — cname, sname.
*/

use shop;

select 
t1.cname,
t1.city,
t2.sell_id,
 t3.sname,
 t3.city
from customers t1
	inner join orders t2
    on t1.cust_id = t2.cust_id
		inner join sellers t3
        on t2.sell_id = t3.sell_id
        where t1.city <> t3.city;
    
    
select * from orders;
select * from customers;
/*
3..Используем БД shop :
Вывести имена покупателей которые ничего никогда не покупали.
Решить задачу двумя способами : через join и через подзапрос
*/

select
t1.cust_id,
t1.cname,
t1.city,
t2.order_id
from customers t1
	left join orders t2
    on t1.cust_id = t2.cust_id
    where t2.cust_id is null;
    
select
t1.cust_id,
t1.cname,
t1.city
-- t2.order_id
from customers t1
         where cust_id  not in 
		(select cust_id from orders);
