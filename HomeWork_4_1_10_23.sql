use learn;

/* 1 уровень сложности: Использовать базу данных students, созданную на уроке для практической работы:
(пункт 1 - 3 сделан на уроке, можно взять из скрипта урока,
который в репозитории по ссылке 
здесь https://github.com/IuriiAV/sqllessons.git  (занятие 4)
*/

select * from students;

-- Задача 4. Поменять тип у gender на char(1)(вспоминаем modifygender)
alter table students
modify gender varchar(1);

-- Задача 5. переименовать поле name на firstname
alter table students
rename column name to firstname;

-- Задача 6. Выборки
-- найти учеников, у которых оценка больше 4
select * from students where avg_mark > 4;

-- найти учеников, у которых не входит в диапазон от 3 до 4
select * from students where avg_mark not between 3 and 4;

-- найти учеников, у которых имя начинается на И
select * from students where firstname like 'И%';

-- найти учеников, у которых оценка 2.2 или 3.1 или 4.7
select * from students where avg_mark in (2.2, 3.1, 4.7);

-- Задача 7. Создать представление, которое содержит всех мужчин
create view man as
select * from students where gender = 'M';
select * from man;

-- Задача 8. Создать представление, которое содержит всех женщин
create view woman as
select * from students where gender = 'F';
select * from woman;

-- Задача 9. Найти набор уникальных оценок
select distinct avg_mark from students;

-- Задача 10. Увеличить всем учащимся оценку в 10 раз (предварительно нужно сделать drop check
--  на колонке с оценками,
-- а так же изменить тип колонки на более большой numeric(3,1))

set sql_safe_updates=0;
alter table students
drop check students_chk_4;  -- ???
-- ALTER TABLE students DROP CHECK students_chk_1;
-- SHOW CREATE TABLE students;

alter table students
modify column avg_mark decimal(3,1);


update students set avg_mark = avg_mark * 10;
 select * from students;

-- Задача 11. Поменяйте у Олега Петрова фамилию на Сидоров
update students set lastname = 'Сидоров' where lastname = 'Петров';
 select * from students;
-- Задача 12. Для всех учеников, у которых оценка не больше 31 увеличить на 10
update students set avg_mark = avg_mark + 10 where avg_mark < 31;